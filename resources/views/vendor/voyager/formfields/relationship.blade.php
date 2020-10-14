@if(isset($options->model) && isset($options->type))
@if(class_exists($options->model))
@php $relationshipField = $row->field; @endphp
@if(isset($options->textarea) && !!$options->textarea)
@if(isset($view) && ($view == 'browse' || $view == 'read'))
@php
$model = app($options->model);
$relationshipData = (isset($data)) ? $data : $dataTypeContent;
$selected_values = isset($relationshipData) ? $relationshipData->belongsToMany($options->model, $options->pivot_table,
$options->foreign_pivot_key ?? null, $options->related_pivot_key ?? null, $options->parent_key ?? null,
$options->key)->get()->map(function ($item, $key) use ($options) {
return $item->{$options->label};
})->all() : array();
@endphp
@if($view == 'browse')
@php
$string_values = implode(", ", $selected_values);
if(mb_strlen($string_values) > 25){ $string_values = mb_substr($string_values, 0, 25) . '...'; }
@endphp
@if(empty($selected_values))
<p>{{ __('voyager::generic.no_results') }}</p>
@else
<p>{{ $string_values }}</p>
@endif
@else
@if(empty($selected_values))
<p>{{ __('voyager::generic.no_results') }}</p>
@else
<ul>
    @foreach($selected_values as $selected_value)
    <li>{{ $selected_value }}</li>
    @endforeach
</ul>
@endif
@endif
@else
@php
$model = app($options->model);
$relationshipData = (isset($data)) ? $data : $dataTypeContent;
$selected_values = isset($relationshipData) ? $relationshipData->belongsToMany($options->model, $options->pivot_table,
$options->foreign_pivot_key ?? null, $options->related_pivot_key ?? null, $options->parent_key ?? null,
$options->key)->get()->map(function ($item, $key) use ($options) {
return $item;
})->all() : array();
@endphp
<div class="form-group">
    <ul class="list-unstyled text-bold" id="list-{{$row->field}}">
        @foreach($selected_values as $item)
        <li><a href="javascript:void(0);" onclick="this.parentNode.parentNode.removeChild(this.parentNode)">&times;</a>
            {{ $item->{$options->label} }}
            <input type="hidden" name="{{$row->field}}[]" value="{{ $item->id }}" /></li>
        @endforeach
    </ul>
    <small>{!! __("Удаляйте из списка нажав &times; слева") !!}</small>
</div>
<div class="form-group">
    <div class="input-group">
        <input class="form-control autocomplete-ajax" type="text" name="{{ $options->column }}"
            id="autocomplete-{{$row->field}}" data-get-items-route="{{route('voyager.' . $dataType->slug.'.relation')}}"
            data-get-items-field="{{$row->field}}" @if(!is_null($dataTypeContent->getKey()))
        data-id="{{$dataTypeContent->getKey()}}" @endif
        data-method="{{ !is_null($dataTypeContent->getKey()) ? 'edit' : 'add' }}"
        >
        <span class="input-group-btn">
            <a class="btn btn-default" type="button" href="javascript:void(0)"
                onclick="addValue(document.getElementById('autocomplete-{{$row->field}}'), '{{ $options->table }}')"
                style="
                margin-top:0;
            margin-bottom:0;
            font-size: 14px;
            line-height: 1.42857143;">+</a>
        </span>
    </div>
    <small>{{ __("Выберите из выпадающего списка, или нажмите + справа если хотите добавить") }}</small>
</div>
@endif
@elseif($options->type == 'belongsTo')
@if(isset($view) && ($view == 'browse' || $view == 'read'))
@php
$relationshipData = (isset($data)) ? $data : $dataTypeContent;
$model = app($options->model);
$query = $model::where($options->key,$relationshipData->{$options->column})->first();
@endphp
@if(isset($query))
<p>{{ $query->{$options->label} }}</p>
@else
<p>{{ __('voyager::generic.no_results') }}</p>
@endif
@else
<select class="form-control select2-ajax" name="{{ $options->column }}"
    data-get-items-route="{{route('voyager.' . $dataType->slug.'.relation')}}" data-get-items-field="{{$row->field}}"
    @if(!is_null($dataTypeContent->getKey())) data-id="{{$dataTypeContent->getKey()}}" @endif
    data-method="{{ !is_null($dataTypeContent->getKey()) ? 'edit' : 'add' }}"
    >
    @php
    $model = app($options->model);
    $query = $model::where($options->key, old($options->column, $dataTypeContent->{$options->column}))->get();
    @endphp

    @if(!$row->required)
    <option value="">{{__('voyager::generic.none')}}</option>
    @endif

    @foreach($query as $relationshipData)
    <option value="{{ $relationshipData->{$options->key} }}" @if(old($options->column,
        $dataTypeContent->{$options->column}) == $relationshipData->{$options->key}) selected="selected"
        @endif>{{ $relationshipData->{$options->label} }}</option>
    @endforeach
</select>

@endif

@elseif($options->type == 'hasOne')

@php
$relationshipData = (isset($data)) ? $data : $dataTypeContent;

$model = app($options->model);
$query = $model::where($options->column, '=', $relationshipData->{$options->key})->first();

@endphp

@if(isset($query))
<p>{{ $query->{$options->label} }}</p>
@else
<p>{{ __('voyager::generic.no_results') }}</p>
@endif

@elseif($options->type == 'hasMany')

@if(isset($view) && ($view == 'browse' || $view == 'read'))

@php
$relationshipData = (isset($data)) ? $data : $dataTypeContent;
$model = app($options->model);

$selected_values = $model::where($options->column, '=', $relationshipData->{$options->key})->get()->map(function ($item,
$key) use ($options) {
return $item->{$options->label};
})->all();
@endphp

@if($view == 'browse')
@php
$string_values = implode(", ", $selected_values);
if(mb_strlen($string_values) > 25){ $string_values = mb_substr($string_values, 0, 25) . '...'; }
@endphp
@if(empty($selected_values))
<p>{{ __('voyager::generic.no_results') }}</p>
@else
<p>{{ $string_values }}</p>
@endif
@else
@if(empty($selected_values))
<p>{{ __('voyager::generic.no_results') }}</p>
@else
<ul>
    @foreach($selected_values as $selected_value)
    <li>{{ $selected_value }}</li>
    @endforeach
</ul>
@endif
@endif

@else


@php
$model = app($options->model);
$modelName = str_replace("App\\", "", get_class($model));
if($dataTypeContent->{$options->key})
$query = $model::where($options->column, '=', $dataTypeContent->{$options->key})->orderBy(isset($options->sort) ?
$options->sort->field : 'sort', isset($options->sort) ? $options->sort->direction : 'asc')->get();

@endphp
@if(isset($query) && count($query))

@if(isset($options->sortable) && !!$options->sortable)


<ul id="photoSortable" class="photo-sortable">
    @foreach($query as $query_res)
    <li data-id="{{ $query_res->id }}">
        <div style="background-image: url('/storage/{{ $query_res->photo }}')"></div>
    </li>
    @endforeach
</ul>


@section("javascript_add")
<script src="https://cdn.jsdelivr.net/npm/sortablejs@latest/Sortable.min.js"></script>
<script>
    Sortable.create(photoSortable, { 
        onEnd: function(evt) {
        let ids = [];
        [].forEach.call(
            evt.target.children,
            el => {
                ids.push(el.dataset.id);
            }
        );
        const request = new XMLHttpRequest();
        const url = "/admin/resort";
        request.responseType = "json";
        request.open("PATCH", url, true);
        request.setRequestHeader(
            "Content-type",
            "application/x-www-form-urlencoded"
        );
        request.addEventListener("readystatechange", () => {
            if (request.readyState === 4 && request.status === 200) {
                let obj = request.response;
                let arr = obj.results;
            }
        });
        request.send("model="+encodeURIComponent('{{ $modelName }}')+"&ids="+ids.join(','));
	}});
</script>
@endsection

@else

<ul>
    @foreach($query as $query_res)
    <li>{{ $query_res->{$options->label} }}</li>
    @endforeach
</ul>
@endif
@else
<p>{{ __('voyager::generic.no_results') }}</p>
@endif

@endif

@elseif($options->type == 'belongsToMany')

@if(isset($view) && ($view == 'browse' || $view == 'read'))

@php
$relationshipData = (isset($data)) ? $data : $dataTypeContent;

$selected_values = isset($relationshipData) ? $relationshipData->belongsToMany($options->model, $options->pivot_table,
$options->foreign_pivot_key ?? null, $options->related_pivot_key ?? null, $options->parent_key ?? null,
$options->key)->get()->map(function ($item, $key) use ($options) {
return $item->{$options->label};
})->all() : array();
@endphp

@if($view == 'browse')
@php
$string_values = implode(", ", $selected_values);
if(mb_strlen($string_values) > 25){ $string_values = mb_substr($string_values, 0, 25) . '...'; }
@endphp
@if(empty($selected_values))
<p>{{ __('voyager::generic.no_results') }}</p>
@else
<p>{{ $string_values }}</p>
@endif
@else
@if(empty($selected_values))
<p>{{ __('voyager::generic.no_results') }}</p>
@else
<ul>
    @foreach($selected_values as $selected_value)
    <li>{{ $selected_value }}</li>
    @endforeach
</ul>
@endif
@endif

@else
<select
    class="form-control @if(isset($options->taggable) && $options->taggable === 'on') select2-taggable @else select2-ajax @endif"
    name="{{ $relationshipField }}[]" multiple
    data-get-items-route="{{route('voyager.' . $dataType->slug.'.relation')}}" data-get-items-field="{{$row->field}}"
    @if(!is_null($dataTypeContent->getKey())) data-id="{{$dataTypeContent->getKey()}}" @endif
    data-method="{{ !is_null($dataTypeContent->getKey()) ? 'edit' : 'add' }}"
    @if(isset($options->taggable) && $options->taggable === 'on')
    data-route="{{ route('voyager.'.\Illuminate\Support\Str::slug($options->table).'.store') }}"
    data-label="{{$options->label}}"
    data-error-message="{{__('voyager::bread.error_tagging')}}"
    @endif
    >

    @php
    $selected_values = isset($dataTypeContent) ? $dataTypeContent->belongsToMany($options->model, $options->pivot_table,
    $options->foreign_pivot_key ?? null, $options->related_pivot_key ?? null, $options->parent_key ?? null,
    $options->key)->get()->map(function ($item, $key) use ($options) {
    return $item->{$options->key};
    })->all() : array();
    $relationshipOptions = app($options->model)->all();
    $selected_values = old($relationshipField, $selected_values);
    @endphp

    @if(!$row->required)
    <option value="">{{__('voyager::generic.none')}}</option>
    @endif

    @foreach($relationshipOptions as $relationshipOption)
    <option value="{{ $relationshipOption->{$options->key} }}" @if(in_array($relationshipOption->{$options->key},
        $selected_values)) selected="selected" @endif>{{ $relationshipOption->{$options->label} }}</option>
    @endforeach

</select>

@endif

@endif

@else

cannot make relationship because {{ $options->model }} does not exist.

@endif

@endif