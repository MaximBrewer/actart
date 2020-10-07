<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Page;
use App\Http\Resources\Page as PageResource;

class PageController extends Controller
{
    //
    public function show(Request $request, $lang, $slug)
    {
        $page = Page::where('slug', $slug)->firstOrFail();
        return [
            'page' => new PageResource($page)
        ];
    }
}
