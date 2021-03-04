@php
$row->details->default && $row->details->default == 'CURRENT_TIMESTAMP' && ($dataTypeContent->{$row->field} = \Carbon\Carbon::now()->format('d.m.Y H:i'));
@endphp

<input @if ($row->required == 1) required @endif type="datetime"
    class="form-control datepicker" name="{{ $row->field }}" value=" @if (isset($dataTypeContent->{$row->field})){{ \Carbon\Carbon::parse(old($row->field, $dataTypeContent->{$row->field}))->format('d.m.Y H:i') }}@else{{ old($row->field) }}@endif">
