<?php

namespace App\Observers;

class Menu
{
    use \App\Traits\CacheForget;
    public function __construct()
    {
         static::$cacheKeys = ['app.ru.menus', 'app.en.menus'];
    }
}
