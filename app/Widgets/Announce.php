<?php

namespace App\Widgets;

use Arrilot\Widgets\AbstractWidget;
use App\Auction;
use Carbon\Carbon;
use Jenssegers\Date\Date;
use Illuminate\Support\Facades\DB;

class Announce extends AbstractWidget
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $auction = Auction::announce();
        return view('widgets.announce', [
            'config' => $this->config,
            'auction' => $auction,
        ]);
    }
}
