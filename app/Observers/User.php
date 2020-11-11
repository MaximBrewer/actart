<?php

namespace App\Observers;

use App\User as UserModel;

class User
{
    public function updating(UserModel $model)
    {
        $model->fio = ($model->surname ? $model->surname . ' ' : '') . $model->name . ($model->middlename ? ' ' . $model->middlename : '');
    }
    //UpdateTranslation

    public function creating(UserModel $model)
    {
        $model->fio = ($model->surname ? $model->surname . ' ' : '') . $model->name . ($model->middlename ? ' ' . $model->middlename : '');
    }
}
