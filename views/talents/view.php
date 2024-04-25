<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\Talents $model */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Talents'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="talents-view">

    <h1><?= Html::encode($this->title) ?></h1>


    <div class="box">
        <div class="box-body no-padding">
            <table class="table table-striped">
                <tbody>
                <tr>
                    <th>Категории талантов</th>
                    <th></th>
                </tr>
                <?php foreach ($model->category as $category) : ?>

                    <tr>
                        <td><?= $category->name?></td>
                        <td>
                            <?php
                            $status = $category->getCategoryStatus($model->id);
                            echo Html::a($status['title'], [$status['url'], 'id' => $model->id], [
                                'class' => 'btn btn-'.$status['color'],
                                'data' => [
                                    //                                        'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                                    'method' => 'post',
                                    'params' => [
                                        'CategoryTalents[category_id]' => $category->id,
                                        'CategoryTalents[talents_id]' => $model->id
                                    ]

                                ],
                            ])
                            ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>

    </div>



</div>
