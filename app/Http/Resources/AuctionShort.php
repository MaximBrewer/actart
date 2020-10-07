<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use TCG\Voyager\Facades\Voyager;

class AuctionShort extends JsonResource
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
                'date' => $this->dateout,
                'status' => $this->status,
                'dateatom' => $this->date,
                'title' => $this->getTranslatedAttribute('title'),
                'announce_text' => $this->getTranslatedAttribute('announce_text'),
                'sublime' => $this->getTranslatedAttribute('sublime'),
                'thumbnail' => Voyager::image($this->thumbnail('xxxl', 'announce_image')),
            ];
    }
}
