<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\OrderController;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/order',[OrderController::class,'order']);
Route::get('/get_order',[OrderController::class,'getOrder']);
Route::get('/get_order_by_id',[OrderController::class,'getOrderById']);
Route::get('/get_delayed_order',[OrderController::class,'getDelayedOrder']);
Route::post('/place_order',[OrderController::class,'placeOrder']);
Route::patch('/update_order_status',[OrderController::class,'updateOrderStatus']);
