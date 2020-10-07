<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Config;
use Carbon\Carbon;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\File;

class Locale
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $locale = Session::get('locale', Config::get('app.locale'));
        App::setLocale($locale);
        Carbon::setLocale($locale);
        Cache::rememberForever('translations.' . $locale, function () {
            return collect([
                'php' => $this->phpTranslations(),
                'json' => $this->jsonTranslations(),
            ]);
        });
        return $next($request);
    }

    private function phpTranslations()
    {
        $path = resource_path('lang/' . App::getLocale());

        return collect(File::allFiles($path))->flatMap(function ($file) {
            $key = ($translation = $file->getBasename('.php'));

            return [$key => trans($translation)];
        });
    }

    private function jsonTranslations()
    {
        $path = resource_path('lang/' . app()->getLocale() . '.json');

        if (is_string($path) && is_readable($path)) {
            return json_decode(file_get_contents($path), true);
        }

        return [];
    }
}
