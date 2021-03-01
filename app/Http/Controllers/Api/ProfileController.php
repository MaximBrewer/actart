<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use App\User;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Http;
use App\Http\Resources\User as UserResource;

class ProfileController extends Controller
{
    public function code(Request $request, $lang, $phone)
    {
        $user = User::find(Auth::id());

        $now = Carbon::now();

        if ($user->phone_sent_at && $now < Carbon::parse($user->phone_sent_at)->addMinute())

            return response()->json([
                'errors' => [
                    'timeout' => Carbon::parse($user->phone_sent_at)->addMinute()->timestamp - $now->timestamp,
                    'message' => __("#WAIT_FOR_REPEAT_CODE#"),
                ]
            ], 422);

        $response = $user->name;
        $code = rand(1111, 9999);

        $msg = "Ваш код: " . $code;

        $url = "https://sms.ru/sms/send?";

        $phone = str_replace("+", "", $phone);

        try {
            $response = Http::get($url, [
                'api_id' => 'AC2FCABC-92EF-3C42-9658-E714E246B3D7',
                'to' => $phone,
                'msg' => $msg,
                'json' => 1,
            ]);
            $response = json_decode($response->body(), true);
            if ($response['sms'][$phone]['status'] == 'ERROR') {
                return response()->json([
                    'errors' => [
                        'message' => __("#ERROR_SENDING_MESSAGE#"),
                        'smsru' => $response['sms'][$phone]['status_text']
                    ]
                ], 422);
            } else {
                $user->update([
                    'phone' => $phone,
                    'phone_code' => $code,
                    'phone_sent_at' => Carbon::now(),
                ]);
                return [
                    'success' => true,
                ];
            }
        } catch (\Exception $e) {
            return response()->json([
                'errors' => [
                    'exception' => $e,
                ]
            ], 422);
        }
    }

    public function codeVerify(Request $request, $lang)
    {
        $code = $request->code;

        $user = User::find(Auth::id());

        if ($user->phone_attempts > 3) {

            $user->update([
                'phone_verified_at' => null,
                'phone_sent_at' => null,
                'phone_code' => null,
                'phone_attempts' => 0
            ]);

            return response()->json([
                'errors' => [
                    'attempts' => $user->phone_attempts,
                    'message' => __("#TOO MANY ATTEMPTS#"),
                ]
            ], 422);
        }

        if ($code != $user->phone_code) {
            $user->update([
                'phone_attempts' => ++$user->phone_attempts
            ]);
            return response()->json([
                'errors' => [
                    'code' => __("#WRONG_PHONE_CODE#")
                ]
            ], 422);
        }

        $user->update([
            'phone_verified_at' => Carbon::now()
        ]);

        return ['user' => new UserResource($user)];
    }
}
