<?php

use Illuminate\Support\Facades\Route;
use TCG\Voyager\Facades\Voyager;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use App\Notifications\Register as RegisterNotification;
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
    Route::patch('/resort', '\App\Http\Controllers\Voyager\VoyagerBaseController@resort')->name('voyager.base.resort');
    Voyager::routes();
});

Route::get('/#login', '\App\Http\Controllers\SpaController@index')->name('login');
Route::get('/{uri?}', '\App\Http\Controllers\SpaController@index')->where('uri', '(.*)');
