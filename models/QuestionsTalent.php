<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "questions_talent".
 *
 * @property int $id
 * @property int $talent_id
 * @property int $questions_id
 * @property int $active
 *
 * @property Questions $questions
 * @property Talents $talent
 */
class QuestionsTalent extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'questions_talent';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['talent_id', 'questions_id'], 'required'],
            [['talent_id', 'questions_id', 'active'], 'integer'],
            [['questions_id'], 'exist', 'skipOnError' => true, 'targetClass' => Questions::class, 'targetAttribute' => ['questions_id' => 'id']],
            [['talent_id'], 'exist', 'skipOnError' => true, 'targetClass' => Talents::class, 'targetAttribute' => ['talent_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'talent_id' => Yii::t('app', 'Talent ID'),
            'questions_id' => Yii::t('app', 'Questions ID'),
            'active' => Yii::t('app', 'Active'),
        ];
    }

    /**
     * Gets query for [[Questions]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getQuestions()
    {
        return $this->hasOne(Questions::class, ['id' => 'questions_id']);
    }

    /**
     * Gets query for [[Talent]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTalent()
    {
        return $this->hasOne(Talents::class, ['id' => 'talent_id']);
    }

    public function checkLink()
    {
        return QuestionsTalent::find()->where(['questions_id'=>$this->questions_id, 'talent_id'=>$this->talent_id])->one();
    }

}
