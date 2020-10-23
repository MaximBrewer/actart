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
        var_dump($carbon->toDateTimeString());
        var_dump($carbon->subHours(3)->toDateTimeString());
        Log::notice("Cron started: " . date(DATE_ATOM));
        DB::connection()->enableQueryLog();
        $started = DB::select(
            'select id from auctions where timestamp(date) < timestamp(?) and status = ?',
            [
                $carbon->toDateTimeString(),
                'coming'
            ]
        );
        $queries = DB::getQueryLog();
        var_dump( $queries );

        foreach ($started as $auction) {
            var_dump($auction->id);
            Auction::find($auction->id)->update(array(
                'started' => 1,
            ));
        }

        $finished = DB::select(
            'select id from auctions where timestamp(date) < timestamp(?) and status = ?',
            [
                $carbon->subHours(3)->toDateTimeString(),
                'started'
            ]
        );
        $queries = DB::getQueryLog();
        var_dump( $queries );

        foreach ($finished as $auction) {
            Auction::find($auction->id)->update(array(
                'finished' => 1,
            ));
        }
    }
}
