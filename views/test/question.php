<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var app\models\Questions $model */

$this->title = Yii::t('app', 'Тест');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="questions-index">



    <?php $form = ActiveForm::begin(); ?>

        <h3><label for="customRange1" class="form-label"><?=$model->name?></label></h3>
        <h1><input type="range" name="Test[value]" class="form-range" id="customRange1"></h1>

        <div class="form-group mt-3">
            <?= Html::submitButton(Yii::t('app', 'Сохранить'), ['class' => 'btn btn-success']) ?>
        </div>

    <?php ActiveForm::end(); ?>



</div>
