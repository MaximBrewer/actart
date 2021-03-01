<?php

use Illuminate\Support\Facades\Route;
use TCG\Voyager\Facades\Voyager;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use App\Notifications\Register as RegisterNotification;

use Illuminate\Support\Str;
use TCG\Voyager\Events\Routing;
use TCG\Voyager\Events\RoutingAdmin;
use TCG\Voyager\Events\RoutingAdminAfter;
use TCG\Voyager\Events\RoutingAfter;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/email/verify/{id}/{hash}', function (Request $request) {
    $user = \App\User::findOrFail($request->id);
    if ($request->hash == sha1($user->getEmailForVerification())) {
        $user->markEmailAsVerified();
        try {
            $user->notify(new RegisterNotification($user));
        } catch (Throwable $e) {
            report($e);
        }
        return redirect('/#login');
    }
    return redirect('/#not_verified');
})->name('verification.verify');

Route::get('lang/{locale}', '\App\Http\Controllers\LangController@index');

Route::group(['prefix' => 'admin'], function () {
    $namespacePrefix = '\\' . config('voyager.controllers.namespace') . '\\';
    Route::group(['middleware' => 'admin.user'], function () use ($namespacePrefix) {
        event(new RoutingAdmin());
        Route::patch('/resort', \Voyager\VoyagerBaseController::class . '@resort')->name('voyager.base.resort');
        Route::get('/lots/{id}/remove-blitz', \Voyager\VoyagerLotsController::class . '@removeBlitz')->name('voyager.bets.blitz.remove');
        Route::get('authors', \Voyager\VoyagerAuthorsController::class . '@index')->name('voyager.authors.index');
        Route::get('authors/create', \Voyager\VoyagerAuthorsController::class . '@create')->name('voyager.authors.create');
        Route::post('authors', \Voyager\VoyagerAuthorsController::class . '@store')->name('voyager.authors.store');
        Route::get('authors/{id}', \Voyager\VoyagerAuthorsController::class . '@show')->name('voyager.authors.show');
        Route::get('authors/{id}/edit', \Voyager\VoyagerAuthorsController::class . '@edit')->name('voyager.authors.edit');
        Route::put('authors/{id}', \Voyager\VoyagerAuthorsController::class . '@update')->name('voyager.authors.update');
        Route::delete('authors/{id}', \Voyager\VoyagerAuthorsController::class . '@destroy')->name('voyager.authors.destroy');
        Route::get('authors/order', \Voyager\VoyagerAuthorsController::class . '@order')->name('voyager.authors.order');
        Route::post('authors/action', \Voyager\VoyagerAuthorsController::class . '@action')->name('voyager.authors.action');
        Route::post('authors/order', \Voyager\VoyagerAuthorsController::class . '@update_order')->name('voyager.authors.update_order');
        Route::get('authors/{id}/restore', \Voyager\VoyagerAuthorsController::class . '@restore')->name('voyager.authors.restore');
        Route::get('authors/relation', \Voyager\VoyagerAuthorsController::class . '@relation')->name('voyager.authors.relation');
        Route::post('authors/remove', \Voyager\VoyagerAuthorsController::class . '@remove_media')->name('voyager.authors.media.remove');
        event(new RoutingAdminAfter());
    });
    Voyager::routes();
});

Route::get('/#login', '\App\Http\Controllers\SpaController@index')->name('login');
Route::get('/{uri?}', '\App\Http\Controllers\SpaController@index')->where('uri', '(.*)');
