<?php

namespace App\Traits;

use Illuminate\Support\Facades\Cache;

trait CacheForget
{
    private static $cacheKeys = [];
    private static function clearCache()
    {
        foreach (static::$cacheKeys as $key)
            Cache::forget($key);
    }
    public function updated()
    {
        static::clearCache();
    }
    public function deleted()
    {
        static::clearCache();
    }
    public function created()
    {
        static::clearCache();
    }
}
