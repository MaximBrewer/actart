<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Observers\Lot as LotObserver;
use App\Observers\Auction as AuctionObserver;
use App\Lot;
use App\Auction;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {

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
    }
}
