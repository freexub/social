<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "category".
 *
 * @property int $id
 * @property string $name
 */
class Category extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'category';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['name'], 'string', 'max' => 150],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
        ];
    }

    public function getTalents(){
        return $this->hasMany(CategoryTalents::className(), ['id' => 'category_id']);
    }

    public function getCategoryStatus($talent_id){
        $model = CategoryTalents::find()->where(['category_id'=>$this->id, 'talents_id'=>$talent_id])->one();
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
