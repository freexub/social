<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Talents $model */

$this->title = Yii::t('app', 'Добавление');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Таланты'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="talents-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
