<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Notifications\Participate as ParticipateNotification;
use App\User;
use App\Auction;

class SendNotification extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'send:notification {user_id} {auction_id}';

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
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        User::find($this->argument('user_id'))->notify(new ParticipateNotification(Auction::find($this->argument('auction_id'))));
        return 0;
    }
}
