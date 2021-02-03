<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Notifications\Participate as ParticipateNotification;
use App\User;
use App\Auction;

class SendNotification extends Command
{
    public $user_id;
    public $auction_id;
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'send:notification';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct($user_id, $auction_id)
    {
        $this->user_id  = $user_id;
        $this->auction_id  = $auction_id;
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        User::find($this->user_id)->notify(new ParticipateNotification(User::find($this->auction_id)));
        return 0;
    }
}
