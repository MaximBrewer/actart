<?php

namespace App\Observers;

class Author
{
    use \App\Traits\CacheForget;
    public function __construct()
    {
         static::$cacheKeys = ['app.ru.authors', 'app.en.authors'];
    }
}
