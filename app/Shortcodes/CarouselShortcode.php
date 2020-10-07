<?php

namespace App\Shortcodes;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class CarouselShortcode
{
    public function register($shortcode, $content, $compiler, $name, $viewData)
    {
        // $images = Cache::get('carousel.shortcode.' . $shortcode->post_id, function ($shortcode) {
        //     return json_encode(DB::table('posts')->select('images')->find($shortcode->post_id));
        // });
        return view('shortcodes.carousel', ['entity' => $shortcode->entity, 'id' => $shortcode->id]);
    }
}
