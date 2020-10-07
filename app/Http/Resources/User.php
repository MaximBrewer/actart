<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Lot as LotResource;

class User extends JsonResource
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
            'favorites' => $this->fids,
            'auctions' => $this->aids
        ];
    }
}
