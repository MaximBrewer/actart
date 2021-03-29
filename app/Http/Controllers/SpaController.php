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
use App\User;
use App\Frame;
use App\Http\Resources\Author as AuthorResource;
use App\Http\Resources\Category as CategoryResource;
use Illuminate\Support\Facades\Cache;


class SpaController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {

        $locale = App::getLocale();

        $authors = Cache::rememberForever('app.' . $locale . '.authors', function () {
            return AuthorResource::collection(User::authors()->where('hidden', 0)->get());
        });

        $menus = Cache::rememberForever('app.' . $locale . '.menus', function () {
            return [
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
        });



        $options =  [
            ['id' => 'categories', 'title' => __('Category'), 'items' => Cache::rememberForever('app.' . $locale . '.categories', function () {
                return Category::all();
            })],
            ['id' => 'styles', 'title' => __('Style'), 'items' => Cache::rememberForever('app.' . $locale . '.styles', function () {
                return Style::all();
            })],
            // ['id' => 'materials', 'title' => __('Material'), 'items' => \App\Material::all()],
            // ['id' => 'techniques', 'title' => __('Technique'), 'items' => \App\Technique::all()],
            // ['id' => 'frames', 'title' => __('Frame'), 'items' => \App\Frame::all()],
        ];

        $announce = Auction::announce() ? new AuctionResource(Auction::announce()) : null;
        $spaces = Space::all();

        $popular = CategoryResource::collection(Category::orderBy('sort', 'asc')->limit(6)->get());
        $experts = ExpertResource::collection(Expert::all());
        $name = config('app.name');


        $auctions = Auction::where(function ($query) {
            $query;
        });
        $coming = AuctionResource::collection($auctions->coming()->get());
        $toGallery = Auction::gallery() ? new AuctionResource(Auction::gallery()) : null;

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

        

        $timer = setting('site.timer');
        $viplimit = setting('site.viplimit');
        $plug = setting('site.plug');

        $how_to_pay = setting($locale . '.how_to_pay');

        $meta_title = setting($locale . '.meta_title');
        $meta_description = setting($locale . '.meta_description');
        $meta_keywords = setting($locale . '.meta_keywords');

        $contract_link = setting($locale . '.contract_link');

        $ticker = [
            'picture' => "/storage/" . setting($locale . '.ticker_picture'),
            'text' => setting($locale . '.ticker_text'),
            'color' => setting($locale . '.ticker_color'),
            'bg' => setting($locale . '.ticker_bg'),
            'ts' => setting($locale . '.text_speed'),
            'ps' => setting($locale . '.img_speed'),
        ];

        $steps = json_decode(setting("site.steps"));

        $translation = setting('site.translation');

        $translations = cache('translations.' . $locale);
        return view('spa', [
            'app' => compact(
                'meta_title',
                'how_to_pay',
                'meta_description',
                'meta_keywords',
                'authors',
                'viplimit',
                'plug',
                'steps',
                'menus',
                'ticker',
                'timer',
                'translations',
                'translation',
                'options',
                'name',
                'locale',
                'toGallery',
                'coming',
                'experts',
                'announce',
                'spaces',
                'gallery',
                'popular',
                'contract_link'
            )
        ]);
    }
}
