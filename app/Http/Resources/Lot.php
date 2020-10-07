<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use TCG\Voyager\Facades\Voyager;

class Lot extends JsonResource
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
            $sizeBase = getimagesize($dir . $this->photo);
            $phArr = json_decode($this->photos);
            $photos = [
                [
                    'full' => Voyager::image($this->photo),
                    'thumbnail' => Voyager::image($this->thumbnail('preview', 'photo')),
                    'pxwidth' => $sizeBase[0],
                    'pxheight' => $sizeBase[1],
                ]
            ];
            if (is_array($phArr)) {
                foreach ($phArr as $ph) {
                    $size = getimagesize($dir . $ph);
                    $photos[] = [
                        'full' => Voyager::image($ph),
                        'thumbnail' => Voyager::image($this->getThumbnail($ph, 'preview')),
                        'pxwidth' => $size[0],
                        'pxheight' => $size[1],
                    ];
                }
            }
            return [
                'id' => $this->id,
                'title' => $this->getTranslatedAttribute('title'),
                'text' => $this->getTranslatedAttribute('text'),
                'thumbnail' => Voyager::image($this->thumbnail('preview', 'photo')),
                'size' => $sizeBase[0] / $sizeBase[1] > 1 ? 2 : 1,
                'width' => $this->width,
                'height' => $this->height,
                'materials' => $this->materials,
                'categories' => $this->categories,
                'frames' => $this->frames,
                'techniques' => $this->techniques,
                'photos' => $photos,
                'styles' => $this->styles,
                'author' => trim($this->user->name . " " . $this->user->surname),
                'author_url' => "/authors/" . $this->user->id,
                'url' => $this->id,
                'pxwidth' => $sizeBase[0],
                'pxheight' => $sizeBase[1],
                'startPrice' => $this->price,
                'auction_id' => $this->auction_id,
                'blitz' => $this->blitz,
                'bets' => $this->bets,
                'sort' => $this->sort,
                'status' => $this->status,
                'price' => count($this->bets) ? $this->bets[0]['bet'] : $this->price
            ];
        }
    }
}
