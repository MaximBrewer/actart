<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Category;
use App\Http\Resources\Category as CategoryResource;

class CategoryController extends Controller
{
    //
    public function popular(Request $request)
    {
        return json_encode([
            'items' => CategoryResource::collection(Category::orderBy('sort', 'asc')->limit(6)->get())
        ]);
    }
}
