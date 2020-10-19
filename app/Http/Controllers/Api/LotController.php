<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use App\Auction;
use App\Http\Resources\Auction as AuctionResource;
use App\Lot;
use App\Http\Resources\Lot as LotResource;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\DB;
use App\Bet;
use Exception;
use App\Events\Auction as AuctionEvent;
use App\Events\Lot as LotEvent;
use Illuminate\Support\Facades\Auth;

class LotController extends Controller
{
    //
    public function index(Request $request)
    {
        $lots = Lot::where(function ($query) {
            $query;
        });
        $limit = $request->get('limit') ? $request->get('limit') : 24;
        $offset = $request->get('offset') ? $request->get('offset') : 0;
        if ($request->get('author')) $lots->where('user_id', $request->get('author'));
        if ($request->get('status')) {
            switch ($request->get('status')) {
                case "available":
                    $lots->whereIn('status', ["auction", "gallery"]);
                    break;
                default:
                    $lots->where('status', $request->get('status'));
                    break;
            }
        };
        if ($request->get('query')) {
            $q = $request->get('query');
            $lots->where(function ($query) use ($q) {
                $query->where('title', 'LIKE', '%' . $q . '%');
            });
        }
        if ($category = $request->get('category')) {
            $lots->whereHas('categories', function (Builder $query) use ($category) {
                $query->where('id', $category);
            });
        };
        if ($style = $request->get('style')) {
            $lots->whereHas('styles', function (Builder $query) use ($style) {
                $query->where('id', $style);
            });
        };

        $sortBy = $request->get('sortBy') ? 'lots.' . $request->get('sortBy') : false;
        if ($request->get('sortBy') == 'author') {
            $lots->leftJoin('users', 'lots.user_id', '=', 'users.id');
            $lots->select(DB::raw("lots.*, users.name"));
            $sortBy = 'users.name';
        }

        if ($request->get('exclude'))
            $lots->where('id', '<>', $request->get('exclude'));


        $lots->orderBy($sortBy ? $sortBy : 'lots.id', $request->get('order') ? $request->get('order') : 'asc');
        return json_encode([
            'next' => $lots->count() - $offset - $limit,
            'items' => LotResource::collection(
                $lots
                    ->limit($limit)
                    ->offset($offset)
                    ->with('bets')
                    ->with('techniques')
                    ->with('materials')
                    ->with('categories')
                    ->with('frames')
                    ->with('styles')
                    ->with('user')
                    ->get()
            ),
        ]);
    }

    public function gallery(Request $request)
    {
        $auction = Auction::gallery();
        return [
            'auction' => new AuctionResource($auction)
        ];
    }

    public function show($lang, $id)
    {
        $lot = Lot::findOrfail($id);
        return [
            'lot' => new LotResource($lot)
        ];
    }

    public function favorites(Request $request)
    {
        $ids = explode(",", $request->get('ids'));
        $lots = Lot::whereIn('id', $ids);
        return json_encode([
            'next' => 0,
            'items' => LotResource::collection(
                $lots
                    ->orderBy('lots.created_at')
                    ->with('bets')
                    ->with('techniques')
                    ->with('materials')
                    ->with('categories')
                    ->with('frames')
                    ->with('styles')
                    ->with('user')
                    ->get()
            ),
        ]);
    }

    public function offer(Request $request, $lot_id, $price)
    {
        return $price;
        $lot = Lot::where('id', $lot_id)->whereIn('status', ['auction', 'gallery'])->firstOrFail();
        $bet = Bet::where('lot_id', $lot_id)->where('bet', ">=", $price)->first();
        if (!$bet) {
            $bet = Bet::create([
                'user_id' => Auth::id(),
                'bet' => $price,
                'lot_id' => $lot->id,
            ]);
            try {
                event(new LotEvent(new LotResource($lot)));
            } catch (Exception $e) {
                var_dump($e->message);
            }
        }
        return null;
    }

    public function blitz(Request $request, $lot_id)
    {
        $lot = Lot::findOrFail($lot_id);
        return null;
    }
}
