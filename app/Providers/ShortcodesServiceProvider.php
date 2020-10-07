<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Webwizo\Shortcodes\Facades\Shortcode;
use App\Shortcodes\CarouselShortcode;

class ShortcodesServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
        Shortcode::register('carousel', CarouselShortcode::class);
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
