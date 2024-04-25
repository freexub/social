<?php

namespace app\controllers;

use app\models\Category;
use app\models\Questions;
use app\models\QuestionsTalent;
use app\models\Talents;
use app\models\TestResult;
use app\models\TestResultSearch;
use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;

class TestController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new TestResultSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        $dataProvider->query->andWhere(['user_id'=>Yii::$app->user->id]);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionQuestion($n=1){
        $question = Questions::find()->where(['sort'=>$n])->one();
        $session = Yii::$app->session;
        if ($question) {
            if ($this->request->isPost) {
                if (!$session['data'])
                    $session['data'] = $question->dataArray;

                $data = $session['data'];
                $data[$n] = (int)$_POST['Test']['value'];
                $session['data'] = $data;

                return $this->redirect(['question','n'=>($n+1)]);
            }
        }else{
            $model = new TestResult();
            $model->user_id = Yii::$app->user->id;
            $model->data = json_encode($session['data']);
            $model->result = $this->testResult($session['data']);
            if ($model->save()){
                if ($session->remove('data')){
                    Yii::$app->session->setFlash('success', 'Поздравляем!!! Вы прошли тест, результаты скоро появятся...');
                    return $this->redirect(['index']);
                }
            }else{
                var_dump($model->errors);
                die();
            }
        }

        return $this->render('question',[
            'model' => $question
        ]);
    }

    function testResult($model){

        $data = $model;
//        $data = (array)json_decode($model->data);
        $result = [];
        foreach ($data as $key => $value){
            $talents = QuestionsTalent::find()->where(['questions_id'=>$key])->all();
            if (count($talents) > 1){
                foreach ($talents as $talent){
                    if (isset($result[$talent->talent_id]) && $result[$talent->talent_id] > 0)
                        $result[$talent->talent_id] =  $result[$talent->talent_id] + $value;
                    else
                        $result[$talent->talent_id] =  $value;
                }
            }else{
                if (isset($result[$talents[0]->talent_id]) && $result[$talents[0]->talent_id] > 0)
                    $result[$talents[0]->talent_id] =  $result[$talents[0]->talent_id] + $value;
                else
                    $result[$talents[0]->talent_id] =  $value;
            }
        }

        $allTalents = Talents::find()->select(['id'])->where(['active'=>0])->asArray()->orderBy('sort ASC')->all();
        $lot = [];
        foreach ($allTalents as $item){
            $lot[(int)$item['id']] = $result[(int)$item['id']];
        }

        uasort($lot, function ($a, $b) {
            if ($a == $b) {
                return 0;
            }
            return ($a < $b) ? 1 : -1;
        });

        return json_encode($lot);
    }

    public function actionView($id){

        $model = $this->findModel($id);
        $category = Category::find()->all();

        return $this->render('view',[
            'model'=> $model,
            'category'=> $category
        ]);
    }

    protected function findModel($id)
    {
        if (($model = TestResult::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
