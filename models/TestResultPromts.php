<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "test_result_promts".
 *
 * @property int $id
 * @property string $message
 * @property string $answer
 * @property int $test_id
 * @property int $promt_id
 */
class TestResultPromts extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'test_result_promts';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['message', 'answer', 'test_id'], 'required'],
            [['message', 'answer'], 'string'],
            [['test_id','promt_id'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'message' => Yii::t('app', 'Message'),
            'answer' => Yii::t('app', 'Answer'),
            'test_id' => Yii::t('app', 'Test ID'),
            'promt_id' => Yii::t('app', 'Prompt ID'),
        ];
    }
}
