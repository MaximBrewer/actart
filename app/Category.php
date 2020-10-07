<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
use TCG\Voyager\Traits\Resizable;

class Category extends Model
{
    use Translatable;
    use Resizable;
    protected $translatable = ['title'];
    //
}
