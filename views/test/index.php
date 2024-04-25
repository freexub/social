<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var app\models\Questions $model */

$this->title = Yii::t('app', 'Тест');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="test-index">

    <h1><a href="question?n=1" class="btn btn-success">Пройти тест</a></h1>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
//        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'user.username',
            'date_create',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, \app\models\TestResult $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                }
            ],
        ],
    ]); ?>

</div>
