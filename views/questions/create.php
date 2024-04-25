<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Questions $model */

$this->title = Yii::t('app', 'Создание вопроса');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Вопросы'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="questions-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
