<?php

namespace App;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Resizable;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Traits\Translatable;
use Jenssegers\Date\Date;

class Event extends Model
{
    use Translatable;
    use Resizable;

    protected $translatable = ['title', 'seo_title', 'excerpt', 'body', 'meta_description', 'meta_keywords'];

    const PUBLISHED = 'PUBLISHED';
    const EXHIBITION = 'exhibition';
    const WORKSHOP = 'workshop';

    protected $dateFormat = 'Y-m-d H:i:s';
    protected $dateStartFormat = 'j F';
    protected $dateFinishFormat = 'j F Y';
    protected $dates = [
        'start',
        'finish',
    ];

    protected $guarded = [];

    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeExhibition(Builder $query)
    {
        return $query->leftJoin('spaces', 'events.space_id', '=', 'spaces.id')->select(DB::raw("events.*, spaces.id, spaces.type"))->where('spaces.type', '=', static::EXHIBITION);
    }


    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeWorkshop(Builder $query)
    {
        return $query->leftJoin('spaces', 'events.space_id', '=', 'spaces.id')->select(DB::raw("events.*, spaces.id, spaces.type"))->where('spaces.type', '=', static::WORKSHOP);
    }


    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopePublished(Builder $query)
    {
        return $query->where('status', '=', static::PUBLISHED);
    }


    public function tags()
    {
        return $this->belongsToMany('App\Tag', 'post_tag');
    }


    public function space()
    {
        return $this->belongsTo('App\Space');
    }


    public function getDatesAttribute()
    {
        if (
            Date::createFromFormat($this->dateFormat, $this->start)->format("Y") ==
            Date::createFromFormat($this->dateFormat, $this->finish)->format("Y")
        )
            return
                Date::createFromFormat($this->dateFormat, $this->start)->format($this->dateStartFormat) . ' - ' .
                Date::createFromFormat($this->dateFormat, $this->finish)->format($this->dateFinishFormat);
    }
}
