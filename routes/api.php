<?php
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::name('api.')->namespace('Api')->group(function () {
    // Unprotected routes
    Route::group(['middleware' => 'guest:api'], function () {

        Route::namespace('Auth')->group(function () {
            Route::post('login', 'LoginController')->name('login');
            Route::post('register', 'RegisterController')->name('register');

            // Password Reset Routes...
            Route::post('password/email', 'ForgotPasswordController@sendResetLinkEmail');
            Route::post('password/reset', 'ResetPasswordController@reset');
        });

        Route::group(['prefix' => '{lang}', 'middleware' => ['api.locale']], function () {

            Route::get('page/{slug}', '\App\Http\Controllers\Api\PageController@show')->name('page.show');
            Route::get('post/{slug}', '\App\Http\Controllers\Api\PostController@show')->name('post.show');
            Route::get('event/{id}', '\App\Http\Controllers\Api\EventController@show')->name('event.show');
            Route::get('author/{id}', '\App\Http\Controllers\Api\AuthorController@show')->name('author.show');

            Route::get('posts', '\App\Http\Controllers\Api\PostController@index')->name('post.index');
            Route::get('events', '\App\Http\Controllers\Api\EventController@index')->name('event.index');

            Route::get('auctions/{id}', '\App\Http\Controllers\Api\AuctionController@show')->name('auction.show');

            Route::get('lots', '\App\Http\Controllers\Api\LotController@index')->name('lot.index');
            Route::get('lots/options', '\App\Http\Controllers\Api\LotController@options')->name('lot.options');
            Route::get('lot/{id}', '\App\Http\Controllers\Api\LotController@show');
            Route::get('favorites', '\App\Http\Controllers\Api\LotController@favorites')->name('lot.favorites');

            Route::get('events', '\App\Http\Controllers\Api\EventController@index')->name('event.index');

            Route::get('experts', '\App\Http\Controllers\Api\ExpertController@index')->name('expert.index');

            Route::get('categories/popular', '\App\Http\Controllers\Api\CategoryController@popular')->name('category.popular');

            Route::get('authors', '\App\Http\Controllers\Api\AuthorController@index')->name('author.index');

            // Route::get('posts/{type}', function ($lang, $type) {
            //     App::setLocale($lang);
            //     $posts = Post::{$type}()->published()->orderBy('created_at')->get();
            //     return json_encode(['posts' => PostResource::collection($posts)]);
            // });
            // Route::get('get_carousel_items/{entity}/{id}', function ($lang, $entity, $id) {
                // return[$entity, $id];
                // $images = Cache::get('carousel.shortcode.' . $entity . '.' . $id, function ($entity, $id) {
                // return 
                // $res = DB::table($entity . 's')->select('images')->find($id);
                // });
                // return json_encode(['slides' => json_decode($res->images), 'prefix' => '/storage/']);
            // });
        });
    });

    // Protected routes
    Route::middleware('auth:api')->group(function () {
        Route::namespace('Auth')->group(function () {
            Route::get('profile', 'ProfileController@index')->name('profile');
            Route::post('logout', 'LogoutController@logout')->name('logout');
        });
    });
});
