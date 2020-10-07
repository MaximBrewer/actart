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
            $size = getimagesize($dir . $this->avatar);
            return [
                'id' => $this->id,
                'name' => $this->getTranslatedAttribute('name'),
                'surname' => $this->getTranslatedAttribute('surname'),
                'preview' => Voyager::image($this->avatar),
                // 'size' => $size[0] / $size[1] > 1 ? 2 : 1,
                // 'width' => $this->width,
                // 'height' => $this->height,
                // 'materials' => $this->materials,
                // 'frames' => $this->frames,
                // 'techniques' => $this->techniques,
                // 'styles' => $this->styles,
                // 'author' => trim($this->user->name . " " . $this->user->surname),
                // 'author_url' => "/authors/" . $this->user->id,
                // 'url' => "/auctions/" . $this->auction->id . '/lot/' . $this->id,
                'pxwidth' => $size[0],
                'pxheight' => $size[1],
                // 'price' => $this->price,
                // 'bets' => $this->bets,
                // 'status' => $this->status
            ];
        }
    }
}
