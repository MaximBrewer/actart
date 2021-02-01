<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use TCG\Voyager\Facades\Voyager;

use Illuminate\Support\Carbon;

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
            $sizeBase = @getimagesize($dir . $this->photo);
            if ($sizeBase) {
                $photos = [
                    [
                        'full' => Voyager::image($this->photo),
                        'thumbnail' => Voyager::image($this->thumbnail('preview', 'photo')),
                        'pxwidth' => $sizeBase[0],
                        'pxheight' => $sizeBase[1],
                    ]
                ];
            }
            $phArr = json_decode($this->photos);
            if (is_array($phArr)) {
                foreach ($phArr as $ph) {
                    $size = @getimagesize($dir . $ph);
                    if ($size) {
                        $photos[] = [
                            'full' => Voyager::image($ph),
                            'thumbnail' => Voyager::image($this->getThumbnail($ph, 'preview')),
                            'pxwidth' => $size[0],
                            'pxheight' => $size[1],
                        ];
                    }
                }
            }
            return [
                'id' => $this->id,
                'title' => $this->getTranslatedAttribute('title'),
                'text' => $this->getTranslatedAttribute('text'),
                'thumbnail' => Voyager::image($this->thumbnail('preview', 'photo')),
                'photo' => Voyager::image($this->photo),
                'size' => $sizeBase[0] / $sizeBase[1] > 1 ? 2 : 1,
                'width' => $this->width,
                'height' => $this->height,
                'materials' => $this->materials,
                'categories' => $this->categories,
                'frames' => $this->frames,
                'techniques' => $this->techniques,
                'lastchance' => $this->lastchance,
                'photos' => $photos,
                'styles' => $this->styles,
                'nextId' => $this->nextId,
                'prevId' => $this->prevId,
                'year' => $this->year,
                'author' => trim($this->user->name . " " . $this->user->surname),
                'author_url' => "/authors/" . $this->user->id,
                'url' => $this->id,
                'pxwidth' => $sizeBase[0],
                'pxheight' => $sizeBase[1],
                'startPrice' => $this->price,
                'declared' => $this->declared,
                'auction_id' => $this->auction_id,
                'blitz' => $this->blitz,
                'bets' => $this->bets,
                'sort' => $this->sort,
                'countdown' => $this->countdown ? Carbon::parse($this->countdown)->format(DATE_ATOM) : $this->countdown,
                'status' => $this->status,
                'price' => count($this->bets) ? $this->bets[0]['bet'] : $this->price
            ];
        }
    }
}
