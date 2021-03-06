<?php

namespace App\Http\Controllers\Api\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\User as UserResource;
use App\User;
use Illuminate\Support\Facades\Auth;

class ProfileController extends Controller
{
    public function index(Request $request)
    {
        if ($request->user()->ban) {
            auth()->logout();
            return response()->json([
                'errors' => [
                    'email' => [__('Sorry your account has been banned.')]
                ]
            ], 422);
        }
        return new UserResource($request->user());
    }

    public function favorites(Request $request, $lang, $action, $id)
    {
        $user = User::findOrFail(Auth::id());
        $action == "add" && $user->favorites()->attach([$id]);
        $action == "remove" && $user->favorites()->detach([$id]);
        return ['user' => new UserResource($user)];
    }
}
