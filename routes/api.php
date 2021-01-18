<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\User;

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

        Route::group(['prefix' => '{lang}', 'middleware' => ['api.locale']], function () {

            Route::namespace('Auth')->group(function () {
                Route::post('login', 'LoginController')->name('login');
                Route::post('register', 'RegisterController')->name('register');

                // Password Reset Routes...
                Route::post('password/email', 'ForgotPasswordController@sendResetLinkEmail');
                Route::post('password/reset', 'ResetPasswordController@reset');

                Route::post('send/confirmation', function (Request $request) {
                    
                    $user = User::where('email', $request->email)->whereNull('email_verified_at')->firstOrFail();

                    $user->sendEmailVerificationNotification();

                    return ['status' => __('A verification link has been sent to your email address.')];
                    
                })->middleware(['throttle:6,1'])->name('verification.send');

            });

            Route::get('page/{slug}', '\App\Http\Controllers\Api\PageController@show')->name('page.show');
            Route::get('post/{slug}', '\App\Http\Controllers\Api\PostController@show')->name('post.show');
            Route::get('event/{id}', '\App\Http\Controllers\Api\EventController@show')->name('event.show');
            Route::get('author/{id}', '\App\Http\Controllers\Api\AuthorController@show')->name('author.show');

            Route::get('posts', '\App\Http\Controllers\Api\PostController@index')->name('post.index');
            Route::get('events', '\App\Http\Controllers\Api\EventController@index')->name('event.index');

            Route::get('auctions/{id}', '\App\Http\Controllers\Api\AuctionController@show')->name('auction.show');
            Route::get('auctions', '\App\Http\Controllers\Api\AuctionController@index')->name('auction.index');
            Route::get('auctions/announce', '\App\Http\Controllers\Api\AuctionController@announce')->name('auction.announce');

            Route::get('lots', '\App\Http\Controllers\Api\LotController@index')->name('lot.index');
            Route::get('lots/options', '\App\Http\Controllers\Api\LotController@options')->name('lot.options');
            Route::get('lot/{id}', '\App\Http\Controllers\Api\LotController@show');

            Route::get('events', '\App\Http\Controllers\Api\EventController@index')->name('event.index');
            Route::get('authors', '\App\Http\Controllers\Api\AuthorController@index')->name('author.index');

            Route::get('get_carousel_items/{entity}/{id}', function ($lang, $entity, $id) {
                $res = DB::table($entity . 's')->select('images')->find($id);
                return json_encode(['slides' => json_decode($res->images), 'prefix' => '/storage/']);
            });
            Route::patch('subscribe', 'SubscribeController@store')->name('subscribe.store');
        });
    });


    // Protected routes
    Route::middleware('auth:api')->group(function () {
        Route::group(['prefix' => '{lang}', 'middleware' => ['api.locale']], function () {
            Route::patch('offer/{lot_id}/{price}', 'LotController@offer')->name('offer');
            Route::patch('blitz/{lot_id}', 'LotController@blitz')->name('blitz');
            Route::group(['prefix' => 'auction/{id}'], function () {
                Route::get('participate', '\App\Http\Controllers\Api\AuctionController@participate')->name('auction.participate');
            });
            Route::post('logout', 'LogoutController@logout')->name('logout');

            // Route::middleware('is_admin')->group(function () {
            Route::group(['prefix' => 'auction/{id}/admin'], function () {
                Route::patch('start', 'AuctionController@start');
                Route::patch('lastchance', 'AuctionController@lastchance');
                Route::patch('sold', 'AuctionController@sold');
                Route::patch('nextlot', 'AuctionController@nextlot');
                Route::patch('finish', 'AuctionController@finish');
                Route::patch('countdown', 'AuctionController@countdown');
            });
            // });

            Route::namespace('Auth')->group(function () {
                Route::get('profile', 'ProfileController@index')->name('profile');
                Route::patch('profile/favorites/{action}/{id}', 'ProfileController@favorites')->name('profile.favorites');
            });
        });
    });
});
