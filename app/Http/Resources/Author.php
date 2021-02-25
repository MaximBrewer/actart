<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use TCG\Voyager\Facades\Voyager;

class Author extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        if ($this) {
            $dir = storage_path("app/public/");
            $size = $this->avatar ?
                getimagesize($dir . $this->avatar) : [0, 0];
            return [
                'id' => $this->id,
                'name' => $this->getTranslatedAttribute('name'),
                'surname' => $this->getTranslatedAttribute('surname'),
                'preview' => $this->avatar ? Voyager::image($this->avatar) : "",
                'studies' => $this->studies,
                'exhibits' => $this->exhibits,
                'professions' => $this->professions,
                'studies' => $this->studies,
                'exhibits' => $this->exhibits,
                'pxwidth' => $size[0],
                'pxheight' => $size[1],
            ];
        }
    }
}
