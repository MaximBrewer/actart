<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class AuctionParticipate extends Mailable
{
    use Queueable, SerializesModels;

    protected $auction;
    protected $user;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($auction, $user)
    {
        //
        $this->auction = $auction;
        $this->user = $user;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Участие в аукционе #' . $this->auction->id)
            ->view('mail.auction.participate')->with([
                'auction' => $this->auction,
                'user' => $this->user
            ]);;
    }
}
