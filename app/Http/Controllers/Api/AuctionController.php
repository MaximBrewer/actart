<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Auction;
use App\User;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\AuctionShort as AuctionResource;
use App\Http\Resources\User as UserResource;
use App\Mail\AuctionParticipate;

class AuctionController extends Controller
{
    //
    public function index(Request $request)
    {
        $auctions = Auction::where(function ($query) {
            $query;
        });
        $limit = $request->get('limit') ? $request->get('limit') : 6;
        $offset = $request->get('offset') ? $request->get('offset') : 0;

        if ($request->get('status')) {
            switch ($request->get('status')) {
                case "available":
                    $auctions->whereIn('status', ["coming", "started"]);
                    break;
                default:
                    $auctions->where('status', $request->get('status'));
                    break;
            }
        };

        $sortBy = $request->get('sortBy') ? 'auctions.' . $request->get('sortBy') : false;
        $auctions->orderBy($sortBy ? $sortBy : 'auctions.id', $request->get('order') ? $request->get('order') : 'asc');

        return [
            'next' => $auctions->count() - $offset - $limit,
            'auctions' => AuctionResource::collection(
                $auctions
                    ->limit($limit)
                    ->offset($offset)
                    ->get()
            ),
        ];
    }

    public function show(Request $request, $lang, $id)
    {
        $auction = Auction::findOrfail($id);
        return [
            'auction' => new \App\Http\Resources\Auction($auction)
        ];
    }
    //
    public function participate(Request $request, $id)
    {
        $user = Auth::user();
        if (!$user->auctions()->where('auctions.id', $id)->exists()) {
            $auction = Auction::findOrFail($id);
            Mail::to($user->email)->send(new AuctionParticipate($auction, $user));
            $user->auctions()->attach($id);
        }
        return ['user' => new UserResource($user)];
    }
}
