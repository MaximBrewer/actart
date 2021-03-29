<?php

namespace App\Observers;

class MenuItem
{
    use \App\Traits\CacheForget;
    public function __construct()
    {
         static::$cacheKeys = ['app.ru.menus', 'app.en.menus'];
    }
}
