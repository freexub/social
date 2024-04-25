<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "questions".
 *
 * @property int $id
 * @property int $sort
 * @property string $name
 * @property string $date_create
 * @property int $active
 */
class Questions extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'questions';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['name'], 'string'],
            [['date_create'], 'safe'],
            [['active','sort'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'sort' => Yii::t('app', 'Порядковый номер'),
            'name' => Yii::t('app', 'Текст вопроса'),
            'date_create' => Yii::t('app', 'Дата создания'),
            'active' => Yii::t('app', 'Статус'),
        ];
    }

    public function getTalents(){
        return Talents::find()->where(['active'=>0])->all();
    }

    public function getDataArray(){
        $models = Questions::find()->select('id')->asArray()->all();
        $arr = [];
        foreach ($models as $model)
            $arr[$model['id']] = 0;
        return $arr;
    }
}
