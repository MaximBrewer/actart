<?php

use Illuminate\Support\Facades\Route;
use TCG\Voyager\Facades\Voyager;
use Illuminate\Support\Facades\Session;
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


Route::get('lang/{locale}', '\App\Http\Controllers\LangController@index');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('/{uri?}', '\App\Http\Controllers\SpaController@index')->where('uri', '(.*)');

