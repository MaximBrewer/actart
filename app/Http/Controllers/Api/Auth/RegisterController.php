<?php

namespace App\Http\Controllers\Api\Auth;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\User as UserResource;
use Illuminate\Support\Facades\Mail;
use Throwable;
use App\Notifications\Register as RegisterNotification;

class RegisterController extends Controller
{
    public function __invoke(Request $request)
    {
        $this->validate($request, [
            'email' => 'email|required|unique:users,email',
            'name' => 'required|string|min:4|max:255',
            'password' => 'required|string|min:8|confirmed'
        ]);

        $user = User::create([
            'email' => $request->email,
            'name' => $request->name,
            'password' => bcrypt($request->password),
        ]);

        if (!$token = auth()->attempt($request->only(['email', 'password']))) {
            return abort(401);
        }

        try {
            $user->notify(new RegisterNotification($user));
        } catch (Throwable $e) {
            report($e);
        }

        return (new UserResource($request->user()))->additional(['meta' => ['token' => $token]]);
    }
}
