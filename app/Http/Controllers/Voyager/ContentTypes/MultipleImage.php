<?php

namespace App\Http\Controllers\Voyager\ContentTypes;

use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Intervention\Image\Constraint;
use Intervention\Image\Facades\Image as InterventionImage;

class MultipleImage extends \TCG\Voyager\Http\Controllers\ContentTypes\BaseType
{
    /**
     * @return string
     */
    public function handle()
    {
        $filesPath = [];
        $files = $this->request->file($this->row->field);

        if (!$files) {
            return;
        }

        foreach ($files as $file) {
            if (!$file->isValid()) {
                continue;
            }

            if (isset($this->options->jpeg) && $this->options->jpeg) {
                $ext = 'jpg';
                $image = InterventionImage::make($file)->encode('jpg', 100)->orientate();
            } else {
                $image = InterventionImage::make($file)->orientate();
                $ext = $file->getClientOriginalExtension();
            }


            $resize_width = null;
            $resize_height = null;

            if (isset($this->options->resize) && (isset($this->options->resize->width) || isset($this->options->resize->height))) {
                if (isset($this->options->resize->width)) {
                    $resize_width = $this->options->resize->width;
                }
                if (isset($this->options->resize->height)) {
                    $resize_height = $this->options->resize->height;
                }
            } else {
                $resize_width = $image->width();
                $resize_height = $image->height();
            }

            $resize_quality = intval($this->options->quality ?? 75);

            $filename = Str::random(20);
            $path = $this->slug . DIRECTORY_SEPARATOR . date('FY') . DIRECTORY_SEPARATOR;
            array_push($filesPath, $path . $filename . '.' . $ext);
            $filePath = $path . $filename . '.' . $ext;

            $image = $image->resize(
                $resize_width,
                $resize_height,
                function (Constraint $constraint) {
                    $constraint->aspectRatio();
                    if (isset($this->options->upsize) && !$this->options->upsize) {
                        $constraint->upsize();
                    }
                }
            )->encode($ext, $resize_quality);

            Storage::disk(config('voyager.storage.disk'))->put($filePath, (string) $image, 'public');

            exec('jpegoptim --strip-all --all-progressive -ptm100 ' . storage_path('app/public/' . $filePath));

            if (isset($this->options->thumbnails)) {
                foreach ($this->options->thumbnails as $thumbnails) {
                    if (isset($thumbnails->name) && isset($thumbnails->scale)) {
                        $scale = intval($thumbnails->scale) / 100;
                        $thumb_resize_width = $resize_width;
                        $thumb_resize_height = $resize_height;

                        if ($thumb_resize_width != null && $thumb_resize_width != 'null') {
                            $thumb_resize_width = $thumb_resize_width * $scale;
                        }

                        if ($thumb_resize_height != null && $thumb_resize_height != 'null') {
                            $thumb_resize_height = $thumb_resize_height * $scale;
                        }

                        $image = InterventionImage::make($file)
                            ->orientate()
                            ->resize(
                                $thumb_resize_width,
                                $thumb_resize_height,
                                function (Constraint $constraint) {
                                    $constraint->aspectRatio();
                                    if (isset($this->options->upsize) && !$this->options->upsize) {
                                        $constraint->upsize();
                                    }
                                }
                            )->encode($ext, $resize_quality);
                    } elseif (isset($thumbnails->crop->width) && isset($thumbnails->crop->height)) {
                        $crop_width = $thumbnails->crop->width;
                        $crop_height = $thumbnails->crop->height;
                        $image = InterventionImage::make($file)
                            ->orientate()
                            ->fit($crop_width, $crop_height)
                            ->encode($ext, $resize_quality);
                    } elseif (isset($thumbnails->resize->width) || isset($thumbnails->resize->height)) {
                        $thumb_resize_width = null;
                        $thumb_resize_height = null;
                        if (intval($thumbnails->resize->width)) {
                            $thumb_resize_width = $thumbnails->resize->width;
                        }
                        if (intval($thumbnails->resize->height)) {
                            $thumb_resize_height = $thumbnails->resize->height;
                        }

                        $resize_quality = isset($thumbnails->quality) ? intval($thumbnails->quality) : 100;

                        $image = $image->resize(
                            $thumb_resize_width,
                            $thumb_resize_height,
                            function (Constraint $constraint) {
                                $constraint->aspectRatio();
                                if (isset($this->options->upsize) && !$this->options->upsize) {
                                    $constraint->upsize();
                                }
                            }
                        )->encode($ext, $resize_quality);
                    }

                    Storage::disk(config('voyager.storage.disk'))->put(
                        $path . $filename . '-' . $thumbnails->name . '.' . $ext,
                        (string) $image,
                        'public'
                    );

                    exec('jpegoptim --strip-all --all-progressive -ptm85 ' . storage_path('app/public/' . $path . $filename . '-' . $thumbnails->name . '.' . $ext));
                }
            }
        }

        return json_encode($filesPath);
    }
}
