<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
use TCG\Voyager\Traits\Resizable;
use Jenssegers\Date\Date;

class Expert extends Model
{
    use Translatable;
    use Resizable;

    protected $translatable = ['name', 'lastname', 'description'];
    //
}
