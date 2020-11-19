<?php

namespace App\Observers;

use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Artisan;

use App\Translate as Model;

class Translate
{
    public function updated(Model $model)
    {
        Artisan::call('cache:clear');
        // Cache::rememberForever('translations.ru', function () {
        //     return collect([
        //         'php' => $this->phpTranslations('ru'),
        //         'json' => $this->jsonTranslations('ru'),
        //         'db' => $this->dbTranslations('ru'),
        //     ]);
        // });
        // Cache::rememberForever('translations.en', function () {
        //     return collect([
        //         'php' => $this->phpTranslations('en'),
        //         'json' => $this->jsonTranslations('en'),
        //         'db' => $this->dbTranslations('en'),
        //     ]);
        // });
    }
    public function created(Model $model)
    {
        Artisan::call('cache:clear');
        // Cache::rememberForever('translations.ru', function () {
        //     return collect([
        //         'php' => $this->phpTranslations('ru'),
        //         'json' => $this->jsonTranslations('ru'),
        //         'db' => $this->dbTranslations('ru'),
        //     ]);
        // });
        // Cache::rememberForever('translations.en', function () {
        //     return collect([
        //         'php' => $this->phpTranslations('en'),
        //         'json' => $this->jsonTranslations('en'),
        //         'db' => $this->dbTranslations('en'),
        //     ]);
        // });
    }

    private function phpTranslations($locale)
    {
        $path = resource_path('lang/' . $locale);

        return collect(File::allFiles($path))->flatMap(function ($file) {
            $key = ($translation = $file->getBasename('.php'));

            return [$key => trans($translation)];
        });
    }

    private function jsonTranslations($locale)
    {
        $path = resource_path('lang/' . $locale . '.json');

        if (is_string($path) && is_readable($path)) {
            return json_decode(file_get_contents($path), true);
        }

        return [];
    }

    private function dbTranslations($locale)
    {
        $translates = Model::all();
        $lang = [];
        foreach ($translates as $translate)
            $lang[$translate->key] = $translate->{$locale};
        return $lang;
    }
}
