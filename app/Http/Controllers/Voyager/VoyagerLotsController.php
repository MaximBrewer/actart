<?php

namespace App\Http\Controllers\Voyager;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Lot;

class VoyagerLotsController extends VoyagerBaseController
{
    //
    public function removeBlitz(Request $request, $id)
    {
        $lot = Lot::find($id);
        $lot->bets[0]->delete();
        return redirect()->route("voyager.lots.show" , $lot->id);
    }
}
