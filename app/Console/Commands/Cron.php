<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Auction;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Config;
use App\User;
use App\Notifications\Reminder as ReminderNotification;

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
        DB::connection()->enableQueryLog();
        Log::info("Cron started: " . date(DATE_ATOM));

        $carbon = new Carbon();
        $started = DB::select(
            'select id from auctions where timestamp(date) < timestamp(?) and status = ?',
            [
                $carbon->toDateTimeString(),
                'coming'
            ]
        );
        foreach ($started as $auction)
            Auction::find($auction->id)->update(['status' => 'started']);

        $canceled = DB::select(
            'select id from auctions where timestamp(date) < timestamp(?) and status  = \'coming\'',
            [
                $carbon->subHours(6)->toDateTimeString()
            ]
        );

        foreach ($canceled as $auction)
            Auction::find($auction->id)->update(['status' => 'finished']);

        $finished = DB::select(
            'select id from auctions where timestamp(date) < timestamp(?) and status = \'started\'',
            [
                $carbon->subHours(6)->toDateTimeString()
            ]
        );

        foreach ($finished as $auction)
            Auction::find($auction->id)->update(['status' => 'finished']);

        $carbon = new Carbon();
        $as = DB::select(
            "SELECT `ua`.`user_id` as `user_id`, `ua`.`auction_id` as `auction_id`
            FROM `user_auction` `ua` 
            left join `auctions` as `a` 
            ON `ua`.`auction_id` = `a`.`id`
            WHERE `ua`.`notified` = 0 
            and `a`.`status` = 'coming' 
            and timestamp(`a`.`date`) < timestamp(?)",
            [
                $carbon->addHour()->toDateTimeString()
            ]
        );

        foreach ($as as $n) {
            $auction = Auction::find($n->auction_id);
            $user = User::find($n->user_id);
            $user->notify(new ReminderNotification($auction, $user));
            DB::update(
                "UPDATE `user_auction`
                SET `notified` = 1
                WHERE `notified` = 0 
                AND `user_id` = ?
                AND `auction_id` = ?",
                [
                    $user->id,
                    $auction->id
                ]
            );
        }

        $queries = DB::getQueryLog();
        Log::info($queries);
    }
}
