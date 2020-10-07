<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Traits\Voyager\Spatial;
use TCG\Voyager\Traits\Translatable;

class Space extends Model
{
    use Spatial;
    use Translatable;
    protected $translatable = ['title', 'address'];
    protected $spatial = ['coords'];
    //
}
