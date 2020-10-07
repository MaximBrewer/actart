<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Event;
use App\Space;
use Illuminate\Support\Facades\App;
use Laracasts\Utilities\JavaScript\JavaScriptFacade as Javascript;
use App\User;
use App\Http\Resources\User as UserResource;
use Illuminate\Support\Facades\Auth;

class EventController extends Controller
{
    //
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('events.index', ['spaces' => Space::all()]);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function show($id)
    {
        $event = Event::findOrFail($id);
        return view('events.show', ['event' => $event])->withShortcodes();
    }
}
