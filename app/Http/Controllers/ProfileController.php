<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Laracasts\Utilities\JavaScript\JavaScriptFacade as Javascript;
use App\Http\Resources\User as UserResource;
use Illuminate\Support\Facades\Auth;
use App\User;

class ProfileController extends Controller
{
    //
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        if (!Auth::check()) return redirect('/');
        return view('profile.index', ["user" => Auth::user()]);
    }
}
