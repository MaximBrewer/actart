<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use App\Post;
use App\Http\Resources\Post as PostResource;
use App\Http\Resources\PostFull as PostFullResource;

class PostController extends Controller
{
    //
    public function index(Request $request)
    {
        $limit = $request->get('limit') ? $request->get('limit') : 24;
        $offset = $request->get('offset') ? $request->get('offset') : 0;
        $cat = $request->get('category') ?  $request->get('category') : 'both';
        $posts = Post::{$cat}();
        return json_encode([
            'items' => PostResource::collection(
                $posts
                    ->published()
                    ->orderBy('created_at', 'desc')
                    ->limit($limit)
                    ->offset($offset)
                    ->get()
            ),
            'next' => $posts->count() - $offset - $limit
        ]);
    }
    //
    public function show(Request $request, $lang, $slug)
    {
        $page = Post::where('slug', $slug)->firstOrFail();
        return [
            'post' => new PostFullResource($page)
        ];
    }
}
