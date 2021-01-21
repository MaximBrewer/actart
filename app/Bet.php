<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bet extends Model
{
    //
    protected $fillable = ['lot_id', 'user_id', 'bet', 'blitz'];


    public function setBetAttribute($value)
    {
        $this->attributes['bet'] = ceil((float) $value * 100);
    }

    public function getBetAttribute($value)
    {
        return (float) $value / 100;
    }

    public function lot()
    {
        return $this->belongsTo('App\Lot');
    }


    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
