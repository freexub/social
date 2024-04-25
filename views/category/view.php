<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\Category $model */
/** @var app\models\Talents $talents */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Categories'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="category-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <div class="box">
        <div class="box-body no-padding">
            <table class="table table-striped">
                <tbody>
                <tr>
                    <th>Id</th>
                    <th>Таланты</th>
                    <th></th>
                </tr>
                <?php foreach ($talents as $talent) : ?>

                    <tr>
                        <td><?= $talent->id?></td>
                        <td><?= $talent->name?></td>
                        <td>
                            <?php
                            $status = $model->getTalentStatus($talent->id);
                            echo Html::a($status['title'], [$status['url'], 'id' => $model->id], [
                                'class' => 'btn btn-'.$status['color'],
                                'data' => [
                                    //                                        'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                                    'method' => 'post',
                                    'params' => [
                                        'CategoryTalents[category_id]' => $model->id,
                                        'CategoryTalents[talents_id]' => $talent->id
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
