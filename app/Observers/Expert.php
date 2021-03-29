<?php

namespace App\Observers;

class Expert
{
    use \App\Traits\CacheForget;
    public function __construct()
    {
         static::$cacheKeys = ['app.ru.experts', 'app.en.experts'];
    }
}
