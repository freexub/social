<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\TestResult $model */
/** @var app\models\Talents $talents */

$this->title = $model->user->username;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Результаты'), 'url' => ['index']];
\yii\web\YiiAsset::register($this);
?>
<div class="questions-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <div class="row">
        <?php foreach ($category as $item):?>
            <div class="col-6">
                <div class="card mb-4" >
                    <div class="card-body">
                        <h5 class="card-title"><?=$item->name?></h5>
                        <div class="accordion" id="accordionExample">
                            <?php $i = 0; foreach ($model->results as $key => $value) :?>
                                <?php if ($model->getTalentByCategory($key, $item->id)) :?>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="heading<?=$key?>">
                                            <button class="accordion-button <?= ($i==0)?:'collapsed' ?>" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<?=$key?>" aria-expanded="<?= ($i==0)? 'true':'false' ?>" aria-controls="collapse<?=$key?>">
                                                <?= '#'.($i+1) . '&nbsp;<strong>' .$model->getTalent($key)->name .'</strong>' ?>
                                            </button>
                                        </h2>
                                        <div id="collapse<?=$key?>" class="accordion-collapse collapse <?= ($i>0)?:'show' ?>" aria-labelledby="heading<?=$key?>" data-bs-parent="#accordionExample">
                                            <div class="accordion-body">
                                                <?=$model->getTalent($key)->about ?>
                                            </div>
                                        </div>
                                    </div>
                                <?php endif;?>
                            <?php $i++; endforeach;?>
                        </div>
                    </div>
                </div>
            </div>
        <?php endforeach;?>
    </div>



    <?php foreach ($model->getPromptResult() as $tem): ?>
        <?php echo $tem->message; ?>
    <?php endforeach;?>


</div>
