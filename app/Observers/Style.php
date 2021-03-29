<?php

namespace App\Observers;

class Style
{
    use \App\Traits\CacheForget;
    public function __construct()
    {
         static::$cacheKeys = ['app.ru.styles', 'app.en.styles'];
    }
}
