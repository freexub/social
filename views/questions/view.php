<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\Questions $model */
/** @var app\models\Talents $talents */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Вопросы'), 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="questions-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <div class="box">
        <div class="box-body no-padding">
            <table class="table table-striped">
                <tbody>
                    <tr>
                        <th>Талант</th>
                        <th></th>
                    </tr>
                    <?php foreach ($model->talents as $talent) : ?>

                        <tr>
                            <td><?= $talent->name?></td>
                            <td>
                                <?php
                                    $status = $talent->getTalentStatus($_GET['id']);
                                    echo Html::a($status['title'], [$status['url'], 'id' => $model->id], [
                                        'class' => 'btn btn-'.$status['color'],
                                        'it' => 111,
                                        'data' => [
    //                                        'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                                            'method' => 'post',
                                            'params' => [
                                                'QuestionsTalent[questions_id]' => $model->id,
                                                'QuestionsTalent[talent_id]' => $talent->id
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




    <?php /*echo DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'name:ntext',
            'date_create',
            'active',
        ],
    ]) */?>

</div>
