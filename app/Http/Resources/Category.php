<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use TCG\Voyager\Facades\Voyager;

class Category extends JsonResource
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
        $size = getimagesize($dir . $this->image);
        return [
            'id' => $this->id,
            'title' => $this->getTranslatedAttribute('title'),
            'preview' => Voyager::image($this->thumbnail('preview', 'image'))
        ];
    }
}