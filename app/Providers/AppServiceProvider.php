<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Observers\Bet as BetObserver;
use App\Observers\Lot as LotObserver;
use App\Observers\Auction as AuctionObserver;
use App\Observers\Setting as SettingObserver;
use App\Observers\User as UserObserver;
use App\Observers\Translate as TranslateObserver;
use TCG\Voyager\Facades\Voyager;
use Illuminate\Events\Dispatcher;
use App\Bet;
use App\Setting;
use App\Lot;
use App\Auction;
use App\User;
use App\Translate;

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
        \TCG\Voyager\Models\Menu::observe(\App\Observers\Menu::class);
        \TCG\Voyager\Models\MenuItem::observe(\App\Observers\MenuItem::class);
        \App\Menu::observe(\App\Observers\Menu::class);

        \App\Category::observe(\App\Observers\Category::class);
        \App\Style::observe(\App\Observers\Style::class);

        Lot::observe(LotObserver::class);
        Auction::observe(AuctionObserver::class);
        Bet::observe(BetObserver::class);
        Setting::observe(SettingObserver::class);
        User::observe(UserObserver::class);
        Translate::observe(TranslateObserver::class);
    }
}
