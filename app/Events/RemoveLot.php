<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use App\Http\Resources\Lot as LotResource;

class RemoveLot implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $id;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($lot)
    {
        $this->id = $lot->id;
        //
    }
  
    public function broadcastAs()
    {
        return 'remove-lot';
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
