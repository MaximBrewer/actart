<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Notifications\Manager\Feedback as ManagerFeedbackNotification;

use App\Feedback;
use App\User;

class FeedbackController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate(
            $request,
            [
                'name' => 'min:3|required',
                'email' => 'email:rfc,dns|required',
                'message' => 'min:10|required',
            ],
            [
                'email.unique' => 'E-mail уже подписан!',
            ]
        );

        $feedback = Feedback::create([
            'name' => $request->name,
            'email' => $request->email,
            'message' => $request->message
        ]);

        try {
            (new User)->forceFill([
                'name' => 'info@act-art.ru',
                'email' => 'info@act-art.ru',
            ])->notify(new ManagerFeedbackNotification($feedback));
        } catch (\Throwable $e) {
            report($e);
        }
        
        return response()->json(['status' => __("#FEEDBACK_SUCCESS_MESSAGE#")], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
