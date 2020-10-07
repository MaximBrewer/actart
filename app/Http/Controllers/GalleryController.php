<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Laracasts\Utilities\JavaScript\JavaScriptFacade as Javascript;
use App\Http\Resources\User as UserResource;
use Illuminate\Support\Facades\Auth;
use App\Lot;

class GalleryController extends Controller
{
    //
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('gallery.index');
    }
    //
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function archive()
    {
        return view('gallery.archive');
    }
    //
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function lot($id)
    {
        $lot = Lot::where('status', 'gallery')->findOrfail($id);
        return view('gallery.lot', ['lot' => $lot]);
    }
}
