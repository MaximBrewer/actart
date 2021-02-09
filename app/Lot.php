<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
use TCG\Voyager\Traits\Resizable;
use Jenssegers\Date\Date;

class Lot extends Model
{
    use Translatable;
    use Resizable;

    protected $perPage = 30;

    protected $translatable = ['title', 'text'];
    protected $appends = ['number'];
    protected $fillable = ['auction_id', 'sort', 'status', 'lastchance', 'countdown'];

    protected $dateFormat = 'Y-m-d H:i:s';
    protected $dateTimeOutFormat = 'j/m/Y';
    protected $dates = [
        'date',
    ];
    //
    public function getNumberAttribute()
    {
        return str_pad($this->id, 3, "0", STR_PAD_LEFT);
    }
    //
    public function getNextIdAttribute()
    {
        return self::where('id', '>', $this->id)->where('status', $this->status)->orderBy('id', 'asc')->pluck('id')->first();
    }
    public function getPrevIdAttribute()
    {
        return self::where('id', '<', $this->id)->where('status', $this->status)->orderBy('id', 'desc')->pluck('id')->first();
    }


    public function setPriceAttribute($value)
    {
        $this->attributes['price'] = ceil((float) $value * 100);
    }

    public function getPriceAttribute($value)
    {
        return (float) $value / 100;
    }

    public function setDeclaredAttribute($value)
    {
        $this->attributes['declared'] = ceil((float) $value * 100);
    }

    public function getDeclaredAttribute($value)
    {
        return (float) $value / 100;
    }

    public function setBlitzAttribute($value)
    {
        $this->attributes['blitz'] = ceil((float) $value * 100);
    }

    public function getBlitzAttribute($value)
    {
        return (float) $value / 100;
    }

    public function bets()
    {
        return $this->hasMany('App\Bet')->orderBy('id', 'DESC');;
    }


    public function user()
    {
        return $this->belongsTo('App\User');
    }


    public function auction()
    {
        return $this->belongsTo('App\Auction');
    }


    public function categories()
    {
        return $this->belongsToMany('App\Category', 'category_lot');
    }

    public function frames()
    {
        return $this->belongsToMany('App\Frame', 'frame_lot');
    }

    public function styles()
    {
        return $this->belongsToMany('App\Style', 'style_lot');
    }

    public function techniques()
    {
        return $this->belongsToMany('App\Technique', 'technique_lot');
    }

    public function materials()
    {
        return $this->belongsToMany('App\Material', 'material_lot');
    }
}
