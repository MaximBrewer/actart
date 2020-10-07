<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bet extends Model
{
    //


    public function setBetAttribute($value)
    {
        $this->attributes['bet'] = ceil((float) $value * 100);
    }

    public function getBetAttribute($value)
    {
        return (float) $value / 100;
    }
}
