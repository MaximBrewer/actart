<?php

namespace App\Http\Controllers\Api\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\User as UserResource;

class LoginController extends Controller
{
    public function __invoke(Request $request)
    {
        $this->validate($request, [
            'email' => 'required',
            'password' => 'required',
        ]);

        if (!$token = auth()->attempt($request->only(['email', 'password']))) {
            return response()->json([
                'errors' => [
                    'email' => [__('Sorry we couldn\'t sign you in with those details.')]
                ]
            ], 422);
        }

        if (!$request->user()->email_verified_at) {
            return response()->json([
                'errors' => [
                    'email' => [__('Sorry your account has not confirmed.')],
                    'modal' => 'confirmation'
                ]
            ], 422);
        }

        if ($request->user()->ban) {
            return response()->json([
                'errors' => [
                    'email' => [__('Sorry your account has been banned.')]
                ]
            ], 422);
        }

        return (new UserResource($request->user()))
            ->additional([
                'meta' => [
                    'token' => $token
                ]
            ]);
    }
}
