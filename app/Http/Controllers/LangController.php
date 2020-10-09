<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Session;

use Illuminate\Http\Request;

class LangController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request, $locale)
    {
        if (!in_array($locale, ['en', 'ru'])) {
            abort(400);
        }
        Session::put('locale', $locale);
        return redirect()->back();
    }
}
