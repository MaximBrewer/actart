<?php

namespace App\Observers;

use App\Setting as SettingModel;

class Setting
{
    //UpdateTranslation

    public function updated(SettingModel $model)
    {
        if ($model->key == 'site.translation' && $model->wasChanged('value')) {
            try {
                event(new \App\Events\UpdateTranslation($model->value));
            } catch (\Throwable $e) {
                report($e);
            }
        }
    }
}
