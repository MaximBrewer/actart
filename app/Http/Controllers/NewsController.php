<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use Laracasts\Utilities\JavaScript\JavaScriptFacade as Javascript;
use App\User;
use App\Http\Resources\User as UserResource;
use Illuminate\Support\Facades\Auth;

class NewsController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('news.index');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function show($slug)
    {
        $post = Post::where('slug', $slug)->first();
        if (!$post) abort(404, 'Page not found');
        return view('news.show', ['post' => $post])->withShortcodes();
    }
}
