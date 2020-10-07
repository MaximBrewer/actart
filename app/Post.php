<?php

namespace App;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Resizable;
use TCG\Voyager\Traits\Translatable;
use Jenssegers\Date\Date;

class Post extends Model
{
    use Translatable;
    use Resizable;

    protected $translatable = ['title', 'seo_title', 'excerpt', 'body', 'meta_description', 'meta_keywords'];

    const PUBLISHED = 'PUBLISHED';
    const NEWS = 'NEWS';
    const BLOG = 'BLOG';

    protected $dateFormat = 'Y-m-d H:i:s';
    protected $dateTimeOutFormat = 'j/m/Y';
    protected $dates = [
        'date',
    ];

    protected $guarded = [];

    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeBoth(Builder $query)
    {
        return $query;
    }

    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeNews(Builder $query)
    {
        return $query->where('category', '=', static::NEWS);
    }


    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeBlog(Builder $query)
    {
        return $query->where('category', '=', static::BLOG);
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


    public function getDateoutAttribute()
    {
        return Date::createFromFormat($this->dateFormat, $this->date)->format($this->dateTimeOutFormat);
    }

}
