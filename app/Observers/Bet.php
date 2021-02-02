<?php

namespace App\Observers;

use App\Bet as BetModel;
use App\Lot as LotModel;
use App\Auction as AuctionModel;
use Throwable;
use App\Events\UpdateLot as UpdateLotEvent;
use App\Events\UpdateAuction as UpdateAuctionEvent;

class Bet
{
    public function updated(BetModel $bet)
    {
        // $lot = LotModel::find($bet->lot_id);
        // event(new LotEvent(new LotResource($lot)));
    }
    public function created(BetModel $bet)
    {
        $lot = LotModel::find($bet->lot_id);
        $lot->update(['countdown' => null]);
        event(new \App\Events\CreateBet($bet));
    }

    /**
     * Handle the User "deleted" event.
     *
     * @param  \App\Models\User  $user
     * @return void
     */
    public function deleted(BetModel $bet)
    {
        event(new \App\Events\RemoveBet($bet->id));
    }

    /**
     * Handle the User "forceDeleted" event.
     *
     * @param  \App\Models\User  $user
     * @return void
     */
    public function forceDeleted(BetModel $bet)
    {
        event(new \App\Events\RemoveBet($bet->id));
    }
}
