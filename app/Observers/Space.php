<?php

namespace App\Observers;

class Space
{
    use \App\Traits\CacheForget;
    public function __construct()
    {
         static::$cacheKeys = ['app.ru.spaces', 'app.en.spaces'];
    }
}
