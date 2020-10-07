<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use TCG\Voyager\Facades\Voyager;

class Expert extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->getTranslatedAttribute('name'),
            'lastname' => $this->getTranslatedAttribute('lastname'),
            'description' => $this->getTranslatedAttribute('description'),
            'thumbnail' => Voyager::image($this->thumbnail('preview', 'image')),
        ];
    }
}
