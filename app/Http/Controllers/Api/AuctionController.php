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
use App\Notifications\Participate as ParticipateNotification;
use Carbon\Carbon;
use App\Events\UpdateAuctionSeeders as UpdateAuctionSeedersEvents;
use Illuminate\Support\Facades\DB;
use App\Lot;

class AuctionController extends Controller
{
    //
    public function index(Request $request)
    {
        $auctions = Auction::where(function ($query) {
            $query;
        });
        $limit = $request->get('limit') ? $request->get('limit') : 10;
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

    public function announce(Request $request, $lang)
    {
        return [
            'auction' => Auction::announce() ? new AuctionResource(Auction::announce()) : null
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
    public function participate(Request $request, $lang, $id)
    {
        $user = User::find(Auth::id());
        if (!$user->auctions()->where('auctions.id', $id)->exists()) {
            $auction = Auction::findOrFail($id);
            $user->notify(new ParticipateNotification($auction));
            $user->auctions()->attach($id);
            event(new UpdateAuctionSeedersEvents($id, DB::table('user_auction')->where('auction_id', $auction->id)->count()));
        }
        return ['user' => new UserResource($user)];
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function start(Request $request, $lang, $id)
    {
        $auction = Auction::find($id);
        $this->next($auction);
        return ['auction' => $auction];
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function lastchance(Request $request, $lang, $id)
    {
        $auction = Auction::find($id);
        $lot = Lot::where('auction_id', $auction->id)->where('status', 'in_auction')->orderBy('sort', 'ASC')->first();
        $lot->update([
            'lastchance' => Carbon::now()
        ]);
        return ['auction' => $auction];
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function sold(Request $request, $lang, $id)
    {
        $auction = Auction::find($id);
        $lot = Lot::where('auction_id', $auction->id)->where('status', 'in_auction')->orderBy('sort', 'ASC')->first();
        if ($lot) $lot->update([
            'status' => 'sold'
        ]);
        $this->next($auction);
        return ['auction' => $auction, 'lot' => $lot];
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function nextlot(Request $request, $lang, $id)
    {
        $auction = Auction::find($id);
        $this->next($auction);
        return ['auction' => $auction];
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    protected function next($auction)
    {
        $lots = Lot::where('auction_id', $auction->id)->where('status', 'in_auction')->get();
        foreach ($lots as $lot) {
            $lot->update([
                'status' => 'discontinued'
            ]);
        }
        if (Lot::where('auction_id', $auction->id)->whereNot('status', 'auction')->count()) sleep(3);
        $lot = Lot::where('auction_id', $auction->id)->where('status', 'auction')->orderBy('sort', 'ASC')->first();
        if ($lot) {
            $lot->update([
                'status' => 'in_auction'
            ]);
        }
        return ['auction' => $auction];
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function finish(Request $request, $lang, $id)
    {
        $auction = Auction::find($id);
        $auction->update([
            'status' => 'finished'
        ]);
        return ['auction' => $auction];
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function countdown(Request $request, $lang, $id)
    {
        $lot = Lot::findOrFail($id);
        $lot->update([
            'countdown' => Carbon::now()
        ]);
        return '';
    }
}
