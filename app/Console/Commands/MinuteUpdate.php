<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Orders;
use App\Models\delayed_order;

class MinuteUpdate extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'minute:update';

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
        $orderData = DB::table('orders')->where('etd', '<', date('Y-m-d H:i:s'))->get();
        if($orderData){
            foreach($orderData as $key=>$val){

                $delayedData = new delayed_order;
                $delayedData->order_id = $val->id;
                $delayedData->etd = $val->etd;
                $delayedData->current_datetime = date('Y-m-d H:i:s');
                $delayedData->save();
                $Orders = new Orders();
                $Orders = Orders::find($val->id);
                $Orders->delay_status = 1;
                $Orders->save();
                
            }
        }
        $this->info("Cron run successfully");
    }
}
