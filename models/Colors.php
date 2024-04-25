<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "colors".
 *
 * @property int $id
 * @property string $name
 * @property string $coloring
 */
class Colors extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'colors';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'name', 'coloring'], 'required'],
            [['id'], 'integer'],
            [['name'], 'string', 'max' => 50],
            [['coloring'], 'string', 'max' => 15],
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
            'coloring' => Yii::t('app', 'Цвет'),
        ];
    }
}
