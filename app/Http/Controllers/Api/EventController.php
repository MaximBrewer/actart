<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Event;
use App\Http\Resources\Event as EventResource;
use App\Http\Resources\EventFull as EventFullResource;


class EventController extends Controller
{
    //
    public function index(Request $request)
    {
        $limit = $request->get('limit') ? $request->get('limit') : 24;
        $offset = $request->get('offset') ? $request->get('offset') : 0;
        $events = $request->get('category') ? Event::{$request->get('category')}() : new Event();
        return json_encode([
            'items' => EventResource::collection(
                $events
                    ->published()
                    ->orderBy('events.created_at', 'desc')
                    ->limit($limit)
                    ->offset($offset)
                    ->get()
            ),
            'next' => $events->count() - $offset - $limit
        ]);
    }
    public function show(Request $request, $lang, $id)
    {
        $page = Event::findOrFail($id);
        return [
            'event' => new EventFullResource($page)
        ];
    }
}
