<?php

namespace App\Observers;

use App\Lot as LotModel;
use App\Events\UpdateLot as UpdateLotEvent;
use App\Events\RemoveLot as RemoveLotEvent;
use App\Events\UpdateAuction as UpdateAuctionEvent;
use Throwable;

class Lot
{
    public function updated(LotModel $lot)
    {
        try {
            event(new UpdateLotEvent($lot));
        } catch (Throwable $e) {
            report($e);
        }
        if ($lot->wasChanged('lastchance')) {
            try {
                event(new UpdateAuctionEvent(\App\Auction::find($lot->auction_id)));
            } catch (Throwable $e) {
                report($e);
            }
        }
        if ($lot->wasChanged('status')) {
            switch ($lot->status) {
                case 'in_auction':
                    try {
                        event(new UpdateAuctionEvent(\App\Auction::find($lot->auction_id)));
                    } catch (Throwable $e) {
                        report($e);
                    }
                    break;
                case 'sold':
                case 'gsold':
                case 'discontinued':
                case 'empty':
                    try {
                        event(new RemoveLotEvent($lot));
                    } catch (Throwable $e) {
                        report($e);
                    }
                default:
                    break;
            }
        }
    }
}
