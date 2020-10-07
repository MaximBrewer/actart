<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Http\Resources\Author as AuthorResource;
use Illuminate\Support\Facades\App;
use Laracasts\Utilities\JavaScript\JavaScriptFacade as Javascript;
use App\Http\Resources\User as UserResource;
use Illuminate\Support\Facades\Auth;
use App\Lot;

class AuthorController extends Controller
{
    //
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('authors.index');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function show($id)
    {
        $author = User::findOrFail($id);
        return view('authors.show', ['author' => $author])->withShortcodes();
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function lot($id, $lot_id)
    {
        $author = User::findOrFail($id);
        $lot = Lot::findOrFail($lot_id);
        return view('authors.lot', ['author' => $author, 'lot' => $lot])->withShortcodes();
    }
}
