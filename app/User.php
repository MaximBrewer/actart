<?php

namespace App;

use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Notifications\Notifiable;
use  Illuminate\Foundation\Auth\User as Authenticatable;
use App\Notifications\ResetPassword as ResetPasswordNotification;
use TCG\Voyager\Traits\Translatable;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Traits\Resizable;
use Illuminate\Auth\MustVerifyEmail;

class User extends \TCG\Voyager\Models\User implements JWTSubject
{
    use Notifiable;
    use Translatable;
    use Resizable;
    use MustVerifyEmail;

    protected $translatable = ['name', 'surname', 'middlename', 'text'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'surname', 'middlename', 'email', 'password',
        'phone', 'fb', 'inst', 'beh', 'phone_code', 'phone_sent_at', 'phone_verified_at', 'phone_attempts'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }

    /**
     * Send the password reset notification.
     *
     * @param  string  $token
     * @return void
     */
    public function sendPasswordResetNotification($token)
    {
        $this->notify(new ResetPasswordNotification($token));
    }

    public function exhibits()
    {
        return $this->belongsToMany('App\Exhibit');
    }

    public function groups()
    {
        return $this->belongsToMany('App\Group');
    }

    public function auctions()
    {
        return $this->belongsToMany('App\Auction', 'user_auction')->coming();
    }

    public function professions()
    {
        return $this->belongsToMany('App\Profession');
    }

    public function studies()
    {
        return $this->belongsToMany('App\Study');
    }

    public function favorites()
    {
        return $this->belongsToMany('App\Lot', 'App\Favorite');
    }

    public function getFidsAttribute()
    {
        return array_map(function ($a) {
            return $a->lot_id;
        }, DB::table('favorites')
            ->select('lot_id')
            ->where('user_id', $this->id)->get()->toArray());
    }

    public function getAidsAttribute()
    {
        return array_map(function ($a) {
            return $a->auction_id;
        }, DB::table('user_auction')
            ->select('auction_id')
            ->where('user_id', $this->id)->get()->toArray());
    }

    /**
     * Scope a query to only include popular users.
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeAuthors($query)
    {
        return $query->where('role_id', 3);
    }
}
