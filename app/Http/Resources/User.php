<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Lot as LotResource;
use App\Http\Resources\Auction as AuctionResource;

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
            'email' => $this->email,
            'vip' => $this->vip,
            'phone' => $this->phone,
            'phone_sent_at' => $this->phone_sent_at,
            'phone_verified_at' => $this->phone_verified_at,
            'username' => $this->username,
            'name' => $this->getTranslatedAttribute('name'),
            'middlename' => $this->getTranslatedAttribute('middlename'),
            'surname' => $this->getTranslatedAttribute('surname'),
            'favorites' => LotResource::collection($this->favorites),
            'auctions' => AuctionResource::collection($this->auctions),
            'role' => $this->role
        ];
    }
}
