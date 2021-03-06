<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use TCG\Voyager\Facades\Voyager;

class PostFull extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $dir = storage_path("app/public/");
        $size = $this->image && is_file($dir . $this->image) ?
            getimagesize($dir . $this->image) : [0, 0];
        return [
            'id' => $this->id,
            'title' => $this->getTranslatedAttribute('title'),
            'excerpt' => $this->getTranslatedAttribute('excerpt'),
            'body' => $this->getTranslatedAttribute('body'),
            'seo_title' => $this->getTranslatedAttribute('seo_title'),
            'meta_description' => $this->getTranslatedAttribute('meta_description'),
            'meta_keywords' => $this->getTranslatedAttribute('meta_keywords'),
            'date' => $this->dateout,
            'slug' => $this->slug,
            'category' => $this->category == 'NEWS' ? __('POSTS_BLOCK_CATEGORY_NEWS') :  __('POSTS_BLOCK_CATEGORY_BLOG'),
            'thumbnail' => Voyager::image($this->thumbnail('preview', 'image')),
            'waterfall' => Voyager::image($this->thumbnail('waterfall', 'image')),
            'image' => Voyager::image($this->image),
            'width' => $size[0],
            'height' => $size[1],
            'url' => "/" . strtolower($this->category) . "/" . $this->slug
        ];
    }
}
