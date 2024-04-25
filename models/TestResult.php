<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "test_result".
 *
 * @property int $id
 * @property int $user_id
 * @property int $test_id
 * @property string $data
 * @property string $result
 * @property int $active
 * @property string $date_create
 */
class TestResult extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'test_result';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'data'], 'required'],
            [['user_id', 'test_id', 'active'], 'integer'],
            [['data','result'], 'string'],
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
            'user_id' => Yii::t('app', 'User ID'),
            'test_id' => Yii::t('app', 'Test ID'),
            'data' => Yii::t('app', 'Data'),
            'result' => Yii::t('app', 'Result'),
            'active' => Yii::t('app', 'Active'),
            'date_create' => Yii::t('app', 'Date Create'),
        ];
    }

    public function getUser(){
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    public function getPromptResult(){
        return TestResultPromts::find()->where(['test_id' => $this->test_id])->all();
    }

    public function getResults(){
        return (array)json_decode($this->result);
    }



    public function getTalentByCategory($id, $category_id){
        return CategoryTalents::find()->where(['talents_id'=>$id, 'category_id'=>$category_id])->one();
    }

    public function getTalent($id){
        return Talents::findOne($id);
    }
}
