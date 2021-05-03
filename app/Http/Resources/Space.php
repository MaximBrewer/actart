<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Space extends JsonResource
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
            'type' => $this->type,
            'title' => $this->getTranslatedAttribute('title'),
            'address' => $this->getTranslatedAttribute('address'),
            'coords' => $this->coords,
            'zoom' => $this->zoom,
        ];
    }
}
