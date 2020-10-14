<?php

namespace App;

use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Notifications\Notifiable;
use  Illuminate\Foundation\Auth\User as Authenticatable;
use App\Notifications\ResetPassword as ResetPasswordNotification;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use TCG\Voyager\Traits\Translatable;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Traits\Resizable;

class User extends \TCG\Voyager\Models\User implements JWTSubject
{
    use Notifiable;
    use Translatable;
    use Resizable;
    protected $translatable = ['name', 'surname', 'middlename', 'text'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
        'phone', 'fb', 'inst', 'beh',
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
        return $this->belongsToMany('App\Auction', 'user_auction');
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
}
