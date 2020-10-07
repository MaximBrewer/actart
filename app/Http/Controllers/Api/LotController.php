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


    public function options(Request $request)
    {
        return [
            ['id' => 'categories', 'title' => __('Category'), 'items' => \App\Category::all()],
            ['id' => 'styles', 'title' => __('Style'), 'items' => \App\Style::all()],
            // ['id' => 'materials', 'title' => __('Material'), 'items' => \App\Material::all()],
            // ['id' => 'techniques', 'title' => __('Technique'), 'items' => \App\Technique::all()],
            // ['id' => 'frames', 'title' => __('Frame'), 'items' => \App\Frame::all()],
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
}
