<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use App\Auction;
use App\Http\Resources\Auction as AuctionResource;
use App\User;
use App\Http\Resources\Author as AuthorResource;
use App\Http\Resources\AuthorFull as AuthorFullResource;
use Illuminate\Support\Facades\DB;

class AuthorController extends Controller
{
    //
    public function index(Request $request)
    {
        $limit = $request->get('limit') ? $request->get('limit') : 24;
        $offset = $request->get('offset') ? $request->get('offset') : 0;
        $authors = User::where('role_id', 3);
        return json_encode([
            'next' => $authors->count() - $offset - $limit,
            'items' => AuthorResource::collection(
                $authors
                    ->orderBy('created_at')
                    ->limit($limit)
                    ->offset($offset)
                    // ->with('bets')
                    ->get()
            ),
        ]);
    }
    //
    public function show(Request $request, $lang, $id)
    {
        $author = User::findOrFail($id);
        return [
            'author' => new AuthorFullResource($author)
        ];
    }
}
