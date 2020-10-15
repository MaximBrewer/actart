<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Lot as LotResource;
use TCG\Voyager\Facades\Voyager;
use Illuminate\Support\Facades\App;

class Auction extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        if ($this)
            return [
                'id' => $this->id,
                'attr' => $this->attr,
                'date' => $this->dateout,
                'dateatom' => $this->date,
                'status' => $this->status,
                'current' => new LotResource($this->current),
                'title' => $this->getTranslatedAttribute('title'),
                'announce_text' => $this->getTranslatedAttribute('announce_text'),
                'sublime' => $this->getTranslatedAttribute('sublime'),
                'text' => $this->getTranslatedAttribute('text'),
                'thumbnail' => Voyager::image($this->thumbnail('xxxl', 'announce_image')),
                'narrow' => Voyager::image($this->thumbnail('narrow', 'header_image')),
                'lots' => LotResource::collection($this->lots)
            ];
    }
}
