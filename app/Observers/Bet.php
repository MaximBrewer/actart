<?php

namespace App\Observers;
use App\Bet as BetModel;
use App\Lot as LotModel;
use App\Events\Lot as LotEvent;
use App\Http\Resources\Lot as LotResource;

class Bet
{
    public function updated(BetModel $bet)
    {
        $lot = LotModel::find($bet->lot_id);
        event(new LotEvent(new LotResource($lot)));
    }
}
