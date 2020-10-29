<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class BeatPrice extends Mailable
{
    use Queueable, SerializesModels;

    protected $lot;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($lot)
    {
        //
        $this->lot = $lot;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('view.name', ['lot' => $this->lot]);
    }
}
