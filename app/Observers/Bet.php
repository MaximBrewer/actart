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
        if ($bet->blitz) {
            $lot->update([
                'status' => 'gsold'
            ]);
        } else {
            if ($lot->status == 'in_auction') {
                try {
                    event(new UpdateAuctionEvent(AuctionModel::find($lot->auction_id)));
                } catch (Throwable $e) {
                    report($e);
                }
            }
            try {
                event(new UpdateLotEvent(LotModel::find($bet->lot_id)));
            } catch (Throwable $e) {
                report($e);
            }
        }
    }
}
