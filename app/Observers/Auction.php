<?php

namespace App\Observers;

use App\Auction as AuctionModel;
use App\Events\UpdateAuctionStatus as UpdateAuctionStatusEvent;
use Illuminate\Support\Facades\DB;
use Exception;
use Throwable;

class Auction
{
    public function creating(AuctionModel $model)
    {
        if ($model->to_announce)
            DB::table($model->getTable())->update(['to_announce' => 0]);
        if ($model->to_gallery)
            DB::table($model->getTable())->update(['to_gallery' => 0]);
    }

    public function updating(AuctionModel $model)
    {
        if ($model->to_announce)
            DB::table($model->getTable())->update(['to_announce' => 0]);
        if ($model->to_gallery)
            DB::table($model->getTable())->update(['to_gallery' => 0]);
    }

    public function created(AuctionModel $model)
    {
        // ... code here
        // try {
        //     event(new CreateAuctionEvent($model));
        // } catch (Throwable $e) {
        //     report($e);
        // }
    }

    public function updated(AuctionModel $model)
    {
        try {
            event(new UpdateAuctionStatusEvent($model->id, $model->status));
        } catch (Throwable $e) {
            report($e);
        }
    }
}
