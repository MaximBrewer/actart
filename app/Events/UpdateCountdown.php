<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

use Illuminate\Support\Carbon;

class UpdateCountdown implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $id;
    public $countdown;
    public $delta;
    /**
     * Create a new event instance.
     *
     * @return void
     */


    public function __construct($lot)
    {
        $this->id = $lot->id;
        $this->countdown = $lot->countdown;
        $this->delta = $lot->countdown ?
            Carbon::now()->timestamp
            - Carbon::parse($lot->countdown)->timestamp
            : $lot->countdown;
        //
    }

    public function broadcastAs()
    {
        return 'update-countdown';
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
