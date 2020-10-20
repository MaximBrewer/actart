<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class Auction
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $auction;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($auction)
    {
        $this->auction = $auction;
        //
    }

  
    public function broadcastAs()
    {
        return 'update-auction';
    }
    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new Channel('act-art');
    }
}
