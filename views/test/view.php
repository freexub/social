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
        <div class="col-4">
            <?php $i = 1; foreach ($category as $item):?>
                <h3 class=" mt-2"><?=$item->name?></h3>
                <ol class="list-group">
                    <?php foreach ($model->results as $key => $value) :?>
                        <?php if ($model->getTalentByCategory($key, $item->id)) :?>
                            <?php $talent = $model->getTalent($key);?>
                            <li class="list-group-item d-flex justify-content-between align-items-start">
                                <span class="badge bg-<?=$talent->color->coloring?>"><?=$i?></span>
                                <div class="ms-2 me-auto">
                                    <div class="fw-bold"><?=$talent->name?></div>
                                </div>
                            </li>
                        <?php  $i++; endif;?>
                    <?php endforeach;?>
                </ol>
            <?php endforeach;?>
        </div>

        <div class="col-8">
            <div class="card mb-3">
                <div class="card-body">
                    <div class="progress mt-4">
                        <?php foreach ($bars as $key => $value):?>
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-<?=$key?>" role="progressbar" style="width: <?=$value?>%" aria-valuenow="<?=$value?>" aria-valuemin="0" aria-valuemax="100"></div>
                        <?php endforeach;?>
                    </div>
                    <div class="row mt-4">
                        <?php foreach ($colors as $color):?>
                            <div class="col-3 text-center">
                                <span class="text-<?=$color->coloring?>"><strong><?=$color->name?></strong></span>
                            </div>
                        <?php endforeach;?>
                    </div>
                </div>
            </div>


            <div class="card mb-3">
            <?php foreach ($model->getPromptResult() as $tem): ?>
                <div class="card-body">
                    <?php echo $tem->message; ?>
                </div>
            <?php endforeach;?>
            </div>

            <?php foreach ($category as $item):?>
                <?php $i = 0; foreach ($model->results as $key => $value) :?>
                    <div class="accordion" id="accordionExample">
                        <?php if ($model->getTalentByCategory($key, $item->id)) :?>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="heading<?=$key?>">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<?=$key?>" aria-expanded="<?= ($i==0)? 'true':'false' ?>" aria-controls="collapse<?=$key?>">
                                        <?= '#'.($i+1) . '&nbsp;' .$model->getTalent($key)->name .'' ?>
                                    </button>
                                </h2>
                                <div id="collapse<?=$key?>" class="accordion-collapse collapse " aria-labelledby="heading<?=$key?>" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <?=$model->getTalent($key)->about ?>
                                    </div>
                                </div>
                            </div>
                        <?php endif;?>
                    <?php $i++; endforeach;?>
                </div>
            <?php endforeach;?>
        </div>
    </div>
</div>
