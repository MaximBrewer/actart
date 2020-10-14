<?php

namespace App\Http\Controllers;

use App\Menu;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use App\Http\Resources\Auction as AuctionResource;
use App\Auction;
use App\Expert;
use App\Space;
use App\Lot;
use App\Http\Resources\Lot as LotResource;
use App\Http\Resources\Expert as ExpertResource;
use App\Category;
use App\Style;
use App\Material;
use App\Technique;
use App\Frame;
use App\Http\Resources\Category as CategoryResource;


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

        $locale = App::getLocale();

        $menus = [
            'topmost' => Menu::display("topmost", "spa"),
            'top1' => Menu::display("top1", "spa"),
            'top2' => Menu::display("top2", "spa"),
            'top3' => Menu::display("top3", "spa"),
            'top4' => Menu::display("top4", "spa"),
            'mobile' => Menu::display("mobile", "spa"),
            'mobile2' => Menu::display("mobile2", "spa"),
            'mobile3' => Menu::display("mobile3", "spa"),
            'copyright' => Menu::display("copyright", "spa"),
            'footerRight' => Menu::display("footer-right", "spa"),
            'footerLeft' => Menu::display("footer-left", "spa"),
        ];

        $options =  [
            ['id' => 'categories', 'title' => __('Category'), 'items' => Category::all()],
            ['id' => 'styles', 'title' => __('Style'), 'items' => Style::all()],
            // ['id' => 'materials', 'title' => __('Material'), 'items' => \App\Material::all()],
            // ['id' => 'techniques', 'title' => __('Technique'), 'items' => \App\Technique::all()],
            // ['id' => 'frames', 'title' => __('Frame'), 'items' => \App\Frame::all()],
        ];

        $announce = new AuctionResource(Auction::announce());
        $spaces = Space::all();

        $popular = CategoryResource::collection(Category::orderBy('sort', 'asc')->limit(6)->get());
        $experts = ExpertResource::collection(Expert::all());
        $name = config('app.name');
        $coming = AuctionResource::collection($auctions->coming()->get());
        $toGallery = new AuctionResource(Auction::gallery());

        $lots = Lot::where('status', 'gallery');

        $gallery = LotResource::collection(
            $lots
                ->with('bets')
                ->with('techniques')
                ->with('materials')
                ->with('categories')
                ->with('frames')
                ->with('styles')
                ->with('user')
                ->get()
        );

        $translations = cache('translations.' . $locale);
        return view('spa', [
            'app' => compact(
                'menus',
                'translations',
                'options',
                'name',
                'locale',
                'toGallery',
                'coming',
                'experts',
                'announce',
                'spaces',
                'gallery',
                'popular'
            )
        ]);
    }
}
