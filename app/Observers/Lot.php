<?php

namespace App\Observers;

use App\Lot as LotModel;
use App\Events\UpdateLot as UpdateLotEvent;
use App\Events\RemoveLot as RemoveLotEvent;
use App\Events\UpdateAuction as UpdateAuctionEvent;
use App\Events\UpdateLotLastchance as UpdateLotLastchanceEvent;
use App\Events\UpdateLotStatus as UpdateLotStatusEvent;
use App\Notifications\GalleryWinner as GalleryWinnerNotification;
use App\Notifications\Manager\GalleryWinner as ManagerGalleryWinnerNotification;
use App\Notifications\AuctionWinner as AuctionWinnerNotification;
use App\Notifications\Manager\AuctionWinner as ManagerAuctionWinnerNotification;
use Throwable;
use App\User as UserModel;

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
            switch ($lot->status) {
                case "gsold":
                    $user = UserModel::find($lot->bets[0]->user_id);
                    foreach (UserModel::where('role_id', 5)->get() as $manager) $manager->notify(new ManagerGalleryWinnerNotification($lot, $user));
                    $user->notify(new GalleryWinnerNotification($lot));
                case "sold":
                    $user = UserModel::find($lot->bets[0]->user_id);
                    $user->notify(new AuctionWinnerNotification($lot));
                    foreach (UserModel::where('role_id', 5)->get() as $manager) $manager->notify(new ManagerAuctionWinnerNotification($lot, $user));
            }
            try {
                event(new UpdateLotStatusEvent($lot->id, $lot->status));
            } catch (Throwable $e) {
                report($e);
            }
        }
    }
}
