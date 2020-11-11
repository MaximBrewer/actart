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

    /**
     * Scope a query to only include popular users.
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeAuthors($query)
    {
        return $query->where('role_id', 3);
    }
}
