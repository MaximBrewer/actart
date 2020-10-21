<?php

namespace App\Observers;

use App\Lot as LotModel;
use App\Events\UpdateLot as UpdateLotEvent;
use App\Events\RemoveLot as RemoveLotEvent;
use App\Events\UpdateAuction as UpdateAuctionEvent;
use App\Events\UpdateLotLastchance as UpdateLotLastchanceEvent;
use App\Events\UpdateLotStatus as UpdateLotStatusEvent;
use Throwable;

class Lot
{
    public function updated(LotModel $lot)
    {
        if ($lot->wasChanged('lastchance')) {
            try {
                event(new UpdateLotLastchanceEvent($lot->id, $lot->lastchance));
            } catch (Throwable $e) {
                report($e);
            }
        }
        if ($lot->wasChanged('status')) {
            try {
                event(new UpdateLotStatusEvent($lot->id, $lot->status));
            } catch (Throwable $e) {
                report($e);
            }
        }
    }
}
