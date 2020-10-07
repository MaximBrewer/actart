<?php

namespace App\Http\Controllers;

use TCG\Voyager\Models\Menu;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use App\Http\Resources\Auction as AuctionResource;
use App\Auction;
use App\Expert;
use App\Space;
use App\Http\Resources\Expert as ExpertResource;

class SpaController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        $auctions = Auction::where(function ($query) {
            $query;
        });
        if ($request->get('attr')) $auctions->where('attr', $request->get('attr'));
        if (strlen($request->get('ids'))) $auctions->whereIn('id', explode(",", $request->get('ids')));

        $menus = [
            'topmost' => Menu::display("topmost", "_json"),
            'top1' => Menu::display("top1", "_json"),
            'top2' => Menu::display("top2", "_json"),
            'top3' => Menu::display("top3", "_json"),
            'top4' => Menu::display("top4", "_json"),
            'mobile' => Menu::display("mobile", "_json"),
            'mobile2' => Menu::display("mobile2", "_json"),
            'mobile3' => Menu::display("mobile3", "_json"),
            'copyright' => Menu::display("copyright", "_json"),
            'footerRight' => Menu::display("footer-right", "_json"),
            'footerLeft' => Menu::display("footer-left", "_json"),
        ];
        $announce = new AuctionResource(Auction::announce());
        $spaces = Space::all();
        
        $experts = ExpertResource::collection(Expert::all());
        $name = config('app.name');
        $coming = AuctionResource::collection($auctions->coming()->get());
        $toGallery = new AuctionResource(Auction::gallery());
        $locale = App::getLocale();
        $translations = cache('translations.' . App::getLocale());
        return view('spa', ['app' => compact('menus', 'translations', 'name', 'locale', 'toGallery', 'coming', 'experts', 'announce', 'spaces')]);
    }
}
