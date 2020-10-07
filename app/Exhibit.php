<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Exhibit extends Model
{
    use Translatable;
    protected $translatable = ['title'];
    protected $fillable = ['title'];
    //
}
