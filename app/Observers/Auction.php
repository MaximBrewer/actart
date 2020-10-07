<?php

namespace App\Observers;

use App\Auction as AuctionModel;
use App\Events\Auction as AuctionEvent;
use App\Http\Resources\Auction as AuctionResource;
use Illuminate\Support\Facades\DB;
use Exception;

class Auction
{
    public function creating(AuctionModel $model)
    {
        if ($model->to_announce)
            DB::table($model->table)->update(['to_announce' => 0]);
        if ($model->to_gallery)
            DB::table($model->table)->update(['to_gallery' => 0]);
    }

    public function updating(AuctionModel $model)
    {
        if ($model->to_announce)
            DB::table($model->table)->update(['to_announce' => 0]);
        if ($model->to_gallery)
            DB::table($model->table)->update(['to_gallery' => 0]);
    }

    public function created(AuctionModel $model)
    {
        // ... code here
    }

    public function updated(AuctionModel $model)
    {
        try {
            event(new AuctionEvent(new AuctionResource($model)));
        } catch (Exception $e) {
        }
    }
}
