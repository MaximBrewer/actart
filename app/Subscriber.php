<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;


class Subscriber extends Model
{
    protected $fillable = ['email', 'hash'];


    public static function boot()
    {
        parent::boot();

        self::creating(function($model){
            $model->hash = Str::random(20);
        });

        self::created(function($model){
            // ... code here
        });

        self::updating(function($model){
            // ... code here
        });

        self::updated(function($model){
            // ... code here
        });

        self::deleting(function($model){
            // ... code here
        });

        self::deleted(function($model){
            // ... code here
        });
    }

}
