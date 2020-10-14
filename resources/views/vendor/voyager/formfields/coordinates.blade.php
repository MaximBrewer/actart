<style>
    #map {
        height: 400px;
        width: 100%;
    }
</style>
<script src='https://api-maps.yandex.ru/2.1/?apikey={{ config('voyager.yandexmaps.key') }}&lang=ru_RU'></script>
@php
$showAutocomplete = property_exists($row->details, 'showAutocompleteInput') ? (bool)$row->details->showAutocompleteInput
: true;
$showAutocomplete = $showAutocomplete ? 'true' : 'false';
$showLatLng = property_exists($row->details, 'showLatLngInput') ? (bool)$row->details->showLatLngInput : true;
$showLatLng = $showLatLng ? 'true' : 'false';
@endphp

<div id="coordinates-formfield">
    <coordinates inline-template ref="coordinates" api-key="{{ config('voyager.yandexmaps.key') }}"
        :points='@json($dataTypeContent->getCoordinates() && count($dataTypeContent->getCoordinates()) ? $dataTypeContent->getCoordinates() : [[ 'lat'=> config('voyager.yandexmaps.center.lat'), 'lng' => config('voyager.yandexmaps.center.lng') ]])'
        :show-autocomplete="{{ $showAutocomplete }}"
        :show-lat-lng="{{ $showLatLng }}"
        :zoom={{ config('voyager.yandexmaps.zoom') }}
        >
        <div>
            <div class="form-group">
                <div class="col-md-5" v-if="showAutocomplete">
                    <label class="control-label">{{ __('voyager::generic.find_by_place') }}</label>
                    <input class="form-control" type="text" placeholder="Москва" v-model="place"
                        v-on:keypress="onInputKeyPress($event)" />
                </div>
                <div class="col-md-2" v-if="showLatLng">
                    <label class="control-label">{{ __('voyager::generic.latitude') }}</label>
                    <input class="form-control" type="number" step="any" name="{{ $row->field }}[lat]"
                        placeholder="{{ config('voyager.yandexmaps.center.lat') }}" v-model="lat" @change="onLatLngInputChange"
                        v-on:keypress="onInputKeyPress($event)" />
                </div>
                <div class="col-md-2" v-if="showLatLng">
                    <label class="control-label">{{ __('voyager::generic.longitude') }}</label>
                    <input class="form-control" type="number" step="any" name="{{ $row->field }}[lng]"
                        placeholder="{{ config('voyager.yandexmaps.center.lng') }}" v-model="lng" @change="onLatLngInputChange"
                        v-on:keypress="onInputKeyPress($event)" />
                </div>

                <div class="clearfix"></div>
            </div>

            <div id="map"></div>
        </div>
    </coordinates>
</div>

@push('javascript')
<script>
    Vue.component('coordinates', {
            props: {
                apiKey: {
                    type: String,
                    required: true,
                },
                points: {
                    type: Array,
                    required: true,
                },
                showAutocomplete: {
                    type: Boolean,
                    default: true,
                },
                showLatLng: {
                    type: Boolean,
                    default: true,
                },
                zoom: {
                    type: Number,
                    required: true,
                }
            },
            data() {
                return {
                    autocomplete: null,
                    lat: '',
                    lng: '',
                    map: null,
                    marker: null,
                    onChangeDebounceTimeout: null,
                    place: null,
                };
            },
            mounted() {
                ymaps.ready(this.initMap);
            },
            methods: {
                initMap: function() {
                    var vm = this;

                    var center = vm.points[vm.points.length - 1];
                    this.setLatLng(center.lat, center.lng);

                    vm.map = new ymaps.Map("map", {
                        center: [center.lat, center.lng],
                        zoom: vm.zoom
                    });
        

                    // Create marker

                    vm.marker = new ymaps.GeoObject({
                        // Описание геометрии.
                        geometry: {
                            type: "Point",
                            coordinates: [center.lat, center.lng]
                        },
                    }, {
                        draggable: true
                    }),

                    // Listen to map drag events
                    // google.maps.event.addListener(vm.marker, 'drag', vm.onMapDrag);

                    /* Событие dragend - получение нового адреса */
                    vm.marker.events.add('dragend', vm.onMapDrag);

                    vm.map.geoObjects.add(vm.marker)
                },

                setLatLng: function(lat, lng) {
                    this.lat = lat;
                    this.lng = lng;
                },

                moveMapAndMarker: function(lat, lng) {
                    // this.marker.setPosition(new google.maps.LatLng(lat, lng));
                    // this.map.panTo(new google.maps.LatLng(lat, lng));
                },

                onMapDrag: function(event) {
			        let cord = event.get('target').geometry.getCoordinates();
                    this.setLatLng(cord[0], cord[1]);
                    let vm = this;

                    ymaps.geocode(cord).then(function(res) {
                        let data = res.geoObjects.get(0).properties.getAll();
                        vm.place = data.text;
                    });
                    this.onChange('mapDragged');
                },

                onInputKeyPress: function(event) {
                    if (event.which === 13) {
                        event.preventDefault();
                    }
                },

                onLatLngInputChange: function(event) {
                    this.moveMapAndMarker(this.lat, this.lng);

                    this.onChange('latLngChanged');
                },

                onChange: function(eventType) {
                    @if (property_exists($row->details, 'onChange'))
                        if (this.onChangeDebounceTimeout) {
                            clearTimeout(this.onChangeDebounceTimeout);
                        }

                        self = this
                        this.onChangeDebounceTimeout = setTimeout(function() {
                            {{ $row->details->onChange }}(eventType, {
                                lat: self.lat,
                                lng: self.lng,
                                place: self.place
                            });
                        }, 300);
                    @endif
                },
            }
        });

        var gMapVm = new Vue({ el: '#coordinates-formfield' });
</script>
@endpush