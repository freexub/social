<?php

namespace app\controllers;

use app\models\Talents;
use app\models\TestResult;
use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use Orhanerday\OpenAi\OpenAi;

class SiteController extends Controller
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
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
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
        return $this->render('index');
        $model = TestResult::findOne(['id'=>13]);
        $talentIds = array_keys(json_decode($model->result,true));
        $talentsArr = Talents::find()->select(['name'])->asArray()->where(['in', 'id', $talentIds])->all();
        $array = [];
        $i = 1;
        foreach ($talentsArr as $item){
            $array[] .= $i.') '.$item['name'];
            $i++;
            if ($i==count($talentsArr))
                $names = implode(", ", $array);
        }

        $promt = "
        Act like a certified high5 professional with IQ 250. Using a personalized approach, describe my profile and personal traits in my university preparation and personal life.
        Provide a comprehensive analysis of my HIGH5 strength assessment results, focusing on the most powerful strengths combinations and offering strategies to leverage all categories of strengths for optimal personal and professional growth.
        Here is the sequence: 
        ".$names." 
        Format Requirements:
        Language: Fluent russian
        Length: 400 words
        Structure: No more than four paragraphs
        Additional Notes:
        Avoid using the specific names of the strengths to maintain a focus on strategy and application.
        Remember that: Strengths 1 to 5 are your most powerful strengths — your HIGH5. Science shows that they are your greatest chance of succeeding in your professional life and being happy in your personal life. Strengths 6 to 10 represent strengths that you might not use on a daily basis, but that can be easily leveraged when needed. They act as a support to your core(1-5) strengths. Strengths 11 to 15 demonstrate patterns that might not come so naturally to you. Therefore, to stop them from hindering your potential, you might want to learn how to navigate situations that require these capabilities by leveraging your top 10 strengths.Strengths 16 to 20 are not necessarily, but might be your weaknesses. Therefore, these are traits you would be better off looking for in a partner or teammate.
        Ensure the tone is empowering and educational, reflecting your expertise as a HIGH5 certified coach. Write like a real human, not an AI model. Make text interesting for 10th grade student.
        Think step by step";

//        var_dump($namesTalent);
//        die();

//
//        $gpt = $open_ai->completion([
//            'model' => 'gpt-3.5-turbo-instruct',
//            'prompt' => $promt,
//            'temperature' => 0.9,
//            'max_tokens' => 150,
//            'frequency_penalty' => 0,
//            'presence_penalty' => 0.6,
//        ]);
//        print_r($gpt);
        die;


    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }

        $model->password = '';
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }


}
