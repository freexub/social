<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "category_talents".
 *
 * @property int $id
 * @property int $talents_id
 * @property int $category_id
 */
class CategoryTalents extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'category_talents';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['talents_id', 'category_id'], 'required'],
            [['talents_id', 'category_id'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'talents_id' => Yii::t('app', 'Talents ID'),
            'category_id' => Yii::t('app', 'Category ID'),
        ];
    }

    public function getCategory(){
        return $this->hasOne(Category::className(), ['id' => 'category_id']);
    }

    public function getTalents(){
        return $this->hasOne(Talents::className(), ['id' => 'talents_id']);
    }
}
