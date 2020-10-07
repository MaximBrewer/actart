<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use TCG\Voyager\Facades\Voyager;

class Event extends JsonResource
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
            'excerpt' => $this->getTranslatedAttribute('excerpt'), 
            'preview' => Voyager::image($this->thumbnail('preview440', 'image')),
            'width' => 440,
            'height' => 360,
            'url' => "/events/" . $this->id,
            'space' => $this->space,
            'dates' => $this->dates
        ];
    }
}
