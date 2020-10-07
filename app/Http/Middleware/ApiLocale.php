<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\App;

class ApiLocale
{

    public function handle($request, Closure $next)
    {
        $languages = config('voyager.multilingual.locales');
        $mainLanguage = config('voyager.multilingual.default');

        $uri = Request::path();
        $segmentsURI = explode('/', $uri);
        if (!empty($segmentsURI[1]) && in_array($segmentsURI[1], $languages))
            App::setLocale($segmentsURI[1]);
        else App::setLocale($mainLanguage);
        return $next($request);
    }
}
