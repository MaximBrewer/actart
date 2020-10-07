<?php

namespace App;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
use TCG\Voyager\Traits\Resizable;
use Jenssegers\Date\Date;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class Auction extends Model
{
    use Translatable;
    use Resizable;
    protected $translatable = ['title', 'sublime', 'text', 'header_text', 'announce_text'];
    //
    protected $dateFormat = 'Y-m-d H:i:s';
    protected $dateTimeOutFormat = 'j F / H:i';
    protected $dates = [
        'date',
    ];
    
    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeComing(Builder $query)
    {
        return $query->where('status', 'coming')->orderBy('sort', 'ASC');
    }



    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeArchive(Builder $query)
    {
        return $query->where('status', 'finished');
    }



    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeStarted(Builder $query)
    {
        return $query->where('status', 'started');
    }



    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeCanceled(Builder $query)
    {
        return $query->where('status', 'canceled');
    }


    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public static function gallery()
    {
        $auction = self::coming()->where('to_gallery', '=', 1)->first();
        return $auction ? $auction : self::nearest();
    }
    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public static function nearest()
    {
        return self::coming()->orderBy('date', 'ASC')->first();
    }
    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public static function announce()
    {
        $auction = self::coming()->where('to_announce', 1)->first();
        return $auction ? $auction : self::nearest();
    }

    public function getDateoutAttribute()
    {
        return Date::createFromFormat($this->dateFormat, $this->date)->format($this->dateTimeOutFormat);
    }

    public function lots()
    {
        return $this->hasMany('App\Lot')->orderBy('sort', "ASC");
    }
}
