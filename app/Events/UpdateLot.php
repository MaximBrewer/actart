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

class UpdateLot implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $lot;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($lot)
    {
        $this->lot = new LotResource($lot);
        //
    }
  
    public function broadcastAs()
    {
        return 'update-lot';
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
