<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Auction;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class Cron extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cron:minute';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Check Auctions';

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
     * @return mixed
     */
    public function handle()
    {
        $carbon = new Carbon();
        Log::notice("Cron started: " .date(DATE_ATOM));

        $started = DB::select(
            'select id from auctions where timestamp(date) < timestamp(?) and status = ?',
            [
                $carbon->toDateTimeString(),
                'coming'
            ]
        );

        foreach ($started as $auction) {
            Auction::find($auction->id)->update(array(
                'started' => 1,
            ));
        }
    }
}
