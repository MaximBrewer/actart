<?php

namespace App\Http\Controllers;

use TCG\Voyager\Models\Page;

use Illuminate\Http\Request;

class PageController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index($slug)
    {
        $page = Page::where('slug', $slug)->first();
        if (!$page) abort(404, 'Page not found');
        return view('page', ['page' => $page])->withShortcodes();
    }
}
