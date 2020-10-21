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
        event(new \App\Events\CreateBet($bet));
        if ($bet->blitz) {
            $lot->update([
                'status' => 'gsold'
            ]);
        }
    }
}
