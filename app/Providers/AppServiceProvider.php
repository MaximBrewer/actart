<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Observers\Bet as BetObserver;
use App\Observers\Lot as LotObserver;
use App\Observers\Auction as AuctionObserver;
use App\Observers\Setting as SettingObserver;
use App\Observers\User as UserObserver;
use TCG\Voyager\Facades\Voyager;
use Illuminate\Events\Dispatcher;
use App\Bet;
use App\Setting;
use App\Lot;
use App\Auction;
use App\User;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        Voyager::useModel('Setting', \App\Setting::class);

        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Lot::observe(LotObserver::class);
        Auction::observe(AuctionObserver::class);
        Bet::observe(BetObserver::class);
        Setting::observe(SettingObserver::class);
        User::observe(UserObserver::class);
    }
}
