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
            'email' => $this->email,
            'username' => $this->username,
            'name' => $this->getTranslatedAttribute('name'),
            'middlename' => $this->getTranslatedAttribute('middlename'),
            'surname' => $this->getTranslatedAttribute('surname'),
            'favorites' => $this->fids,
            'auctions' => $this->aids,
            'role' => $this->role
        ];
    }
}
