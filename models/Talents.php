<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "talents".
 *
 * @property int $id
 * @property int $name
 * @property int $color_id
 * @property string|null $about
 * @property string|null $date_create
 * @property int $active
 */
class Talents extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'talents';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['active','color_id'], 'integer'],
            [['about'], 'string'],
            [['name'], 'string', 'max'=>50],
            [['date_create'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Название'),
            'color_id' => Yii::t('app', 'Цвет'),
            'about' => Yii::t('app', 'Описание'),
            'date_create' => Yii::t('app', 'Дата создания'),
            'active' => Yii::t('app', 'Статус'),
        ];
    }

    public function getColor(){
        return $this->hasOne(Colors::className(), ['id' => 'color_id']);
    }

    public function getCategory(){
        return Category::find()->all();
    }

    public function getTalentStatus($question_id){
        $model = QuestionsTalent::find()->where(['questions_id'=>$question_id, 'talent_id'=>$this->id])->one();
        $array = [];
        if (isset($model)){
            $array = [
                'url' => 'delete-link',
                'color' => 'danger',
                'title' => Yii::t('app', 'Убрать')
            ];
        }else{
            $array = [
                'url' => 'new-link',
                'color' => 'primary',
                'title' => Yii::t('app', 'Назначить')
            ];
        }
        return $array;
    }
}
