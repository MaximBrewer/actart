<?php

namespace App\Observers;

use Throwable;
use App\Notifications\VipRegister as VipRegisterNotification;

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
    public function updated(UserModel $user)
    {
        if ($user->wasChanged('vip') && $user->vip) {
            try {
                $user->notify(new VipRegisterNotification($user));
            } catch (Throwable $e) {
                report($e);
            }
        }
    }
}
