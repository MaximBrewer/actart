<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use TCG\Voyager\Facades\Voyager;

class EventFull extends JsonResource
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
        return [
            'id' => $this->id,
            'title' => $this->getTranslatedAttribute('title'),
            'body' => $this->getTranslatedAttribute('body'),
            'excerpt' => $this->getTranslatedAttribute('excerpt'), 
            'image' => Voyager::image($this->image),
            'width' => 440,
            'height' => 360,
            'url' => "/events/" . $this->id,
            'space' => $this->space,
            'meta_title' => $this->getTranslatedAttribute('meta_title'),
            'meta_description' => $this->getTranslatedAttribute('meta_description'),
            'meta_keywords' => $this->getTranslatedAttribute('meta_keywords'),
            'dates' => $this->dates
        ];
    }
}
