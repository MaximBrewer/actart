<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Http\Resources\User as UserResource;

class UserController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function favoritesAdd($id)
    {
        $user = User::findOrFail(Auth::id());
        $user->favorites()->attach([$id]);
        return ['user' => new UserResource($user)];
    }
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function favoritesRemove($id)
    {
        $user = User::findOrFail(Auth::id());
        $user->favorites()->detach([$id]);
        return ['user' => new UserResource($user)];
    }
}
