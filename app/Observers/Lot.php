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
use Illuminate\Support\Facades\Cache;

use App\Events\UpdateCountdown as UpdateCountdownEvent;

class Lot
{
    public function updating(LotModel $lot)
    {
        if ($lot->isDirty('auction_id')) {
            $lot->lastchance = null;
            $lot->countdown = null;
        }
        if ($lot->isDirty('status')) {
            switch ($lot->status) {
                case "gallery":
                case "auction":
                    $lot->lastchance = null;
                    $lot->countdown = null;
                    break;
                case "gsold":
                case "sold":
                    $lot->won_id = $lot->bets[0]->user_id;
                    break;
            }
        }
    }

    public function updated(LotModel $lot)
    {
        Cache::forget('app.en.gallery');
        Cache::forget('app.ru.gallery');
        Cache::forget('app.en.announce');
        Cache::forget('app.ru.announce');
        Cache::forget('app.en.coming');
        Cache::forget('app.ru.coming');
        Cache::forget('app.en.toGallery');
        Cache::forget('app.ru.toGallery');
        if ($lot->wasChanged('countdown')) {
            try {
                event(new UpdateCountdownEvent($lot));
            } catch (Throwable $e) {
                report($e);
            }
        }
        if ($lot->wasChanged('lastchance')) {
            try {
                event(new UpdateLotLastchanceEvent($lot->id, $lot->lastchance));
            } catch (Throwable $e) {
                report($e);
            }
        }
        if ($lot->wasChanged('auction_id')) {
            $lot->bets()->delete();
        }
        if ($lot->wasChanged('status')) {
            switch ($lot->status) {
                case "gallery":
                case "auction":
                    $lot->bets()->delete();
                    break;
                case "gsold":
                    $user = UserModel::find($lot->bets[0]->user_id);
                    foreach (UserModel::where('role_id', 5)->get() as $manager) $manager->notify(new ManagerGalleryWinnerNotification($lot, $user));
                    $user->notify(new GalleryWinnerNotification($lot));
                    break;
                case "sold":
                    $user = UserModel::find($lot->bets[0]->user_id);
                    $user->notify(new AuctionWinnerNotification($lot));
                    foreach (UserModel::where('role_id', 5)->get() as $manager) $manager->notify(new ManagerAuctionWinnerNotification($lot, $user));
                    break;
            }
            try {
                event(new UpdateLotStatusEvent($lot->id, $lot->status, $lot->won_id));
            } catch (Throwable $e) {
                report($e);
            }
        }
    }

    public function deleted(LotModel $lot)
    {
        Cache::forget('app.en.gallery');
        Cache::forget('app.ru.gallery');
        Cache::forget('app.en.announce');
        Cache::forget('app.ru.announce');
        Cache::forget('app.en.coming');
        Cache::forget('app.ru.coming');
        Cache::forget('app.en.toGallery');
        Cache::forget('app.ru.toGallery');
    }
    public function created(LotModel $lot)
    {
        Cache::forget('app.en.gallery');
        Cache::forget('app.ru.gallery');
        Cache::forget('app.en.announce');
        Cache::forget('app.ru.announce');
        Cache::forget('app.en.coming');
        Cache::forget('app.ru.coming');
        Cache::forget('app.en.toGallery');
        Cache::forget('app.ru.toGallery');
    }
}
