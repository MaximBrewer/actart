<?php

namespace App\Observers;

class Category
{
    use \App\Traits\CacheForget;
    public function __construct()
    {
        static::$cacheKeys = ['app.ru.categories', 'app.en.categories', 'app.en.popular', 'app.ru.popular'];
    }
}
