<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Auction;
use App\Http\Resources\AuctionShort as AuctionResource;

class AuctionController extends Controller
{
    //
    public function coming(Request $request)
    {
        $auctions = Auction::where(function ($query) {
            $query;
        });
        if ($request->get('attr')) $auctions->where('attr', $request->get('attr'));
        if (strlen($request->get('ids'))) $auctions->whereIn('id', explode(",", $request->get('ids')));

        return [
            'auctions' => AuctionResource::collection($auctions->coming()->get())
        ];
    }
    //
    public function show(Request $request, $lang, $id)
    {
        $auction = Auction::findOrfail($id);
        return [
            'auction' => new \App\Http\Resources\Auction($auction)
        ];
    }
}
