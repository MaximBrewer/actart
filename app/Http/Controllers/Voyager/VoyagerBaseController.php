<?php

namespace App\Http\Controllers\Voyager;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use ReflectionClass;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Database\Schema\Table;
use TCG\Voyager\Database\Types\Type;
use TCG\Voyager\Events\BreadAdded;
use TCG\Voyager\Events\BreadDeleted;
use TCG\Voyager\Events\BreadUpdated;
use TCG\Voyager\Facades\Voyager;
use Exception;
use TCG\Voyager\Http\Controllers\ContentTypes\Checkbox;
use App\Http\Controllers\Voyager\ContentTypes\Coordinates;
use TCG\Voyager\Http\Controllers\ContentTypes\File;
use App\Http\Controllers\Voyager\ContentTypes\Image as ContentImage;
use TCG\Voyager\Http\Controllers\ContentTypes\MultipleCheckbox;
use App\Http\Controllers\Voyager\ContentTypes\MultipleImage;
use TCG\Voyager\Http\Controllers\ContentTypes\Password;
use TCG\Voyager\Http\Controllers\ContentTypes\Relationship;
use TCG\Voyager\Http\Controllers\ContentTypes\SelectMultiple;
use TCG\Voyager\Http\Controllers\ContentTypes\Text;
use TCG\Voyager\Http\Controllers\ContentTypes\Timestamp;

class VoyagerBaseController extends \TCG\Voyager\Http\Controllers\VoyagerBaseController
{
    /**
     * Get BREAD relations data.
     *
     * @param Request $request
     *
     * @return mixed
     */
    public function resort(Request $request)
    {
        $modelName = $request->post('model');
        $ids = explode(",", $request->post('ids'));
        if (!$modelName || !is_array($ids)) return false;
        foreach ($ids as $key => $id) {
            $model = ("App\\" . $modelName)::find($id);
            $model->update([
                'sort' => $key * 1 + 1
            ]);
        }
        return $ids;
    }
    /**
     * Get BREAD relations data.
     *
     * @param Request $request
     *
     * @return mixed
     */

    public function addRelation(Request $request)
    {
        $slug = $this->getSlug($request);
        $page = $request->input('page');
        $on_page = 50;
        $search = $request->input('search', false);
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $method = $request->input('method', 'add');

        $model = app($dataType->model_name);
        if ($method != 'add') {
            $model = $model->find($request->input('id'));
        }
        $this->authorize($method, $model);


        $rows = $dataType->{$method . 'Rows'};

        if ($value = $request->input('value'))
            foreach ($rows as $key => $row) {
                if ($row->field === $request->input('type')) {

                    $options = $row->details;
                    $model = app($options->model);

                    $result = $model::create([
                        'title' => $value
                    ]);

                    return response()->json([
                        'id'    => $result->id,
                        'title'    => $result->title,
                    ]);
                }
            }

        // No result found, return empty array
        return response()->json([], 404);
    }

    public function getContentBasedOnType(Request $request, $slug, $row, $options = null)
    {
        switch ($row->type) {
                /********** PASSWORD TYPE **********/
            case 'password':
                return (new Password($request, $slug, $row, $options))->handle();
                /********** CHECKBOX TYPE **********/
            case 'checkbox':
                return (new Checkbox($request, $slug, $row, $options))->handle();
                /********** MULTIPLE CHECKBOX TYPE **********/
            case 'multiple_checkbox':
                return (new MultipleCheckbox($request, $slug, $row, $options))->handle();
                /********** FILE TYPE **********/
            case 'file':
                return (new File($request, $slug, $row, $options))->handle();
                /********** MULTIPLE IMAGES TYPE **********/
            case 'multiple_images':
                return (new MultipleImage($request, $slug, $row, $options))->handle();
                /********** SELECT MULTIPLE TYPE **********/
            case 'select_multiple':
                return (new SelectMultiple($request, $slug, $row, $options))->handle();
                /********** IMAGE TYPE **********/
            case 'image':
                return (new ContentImage($request, $slug, $row, $options))->handle();
                /********** DATE TYPE **********/
            case 'date':
                /********** TIMESTAMP TYPE **********/
            case 'timestamp':
                return (new Timestamp($request, $slug, $row, $options))->handle();
                /********** COORDINATES TYPE **********/
            case 'coordinates':
                return (new Coordinates($request, $slug, $row, $options))->handle();
                /********** RELATIONSHIPS TYPE **********/
            case 'relationship':
                return (new Relationship($request, $slug, $row, $options))->handle();
                /********** ALL OTHER TEXT TYPE **********/
            default:
                return (new Text($request, $slug, $row, $options))->handle();
        }
    }
}
