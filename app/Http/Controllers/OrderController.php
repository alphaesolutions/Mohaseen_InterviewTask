<?php

namespace App\Http\Controllers;
use DB;
use Illuminate\Http\Request;
use App\Models\Orders;
use App\Models\order_details;

class OrderController extends Controller
{
    public function __construct() {

    }
    public function index(){
        return ["data"=>["name"=>"test"]];
    }

    //Get all orders
    public function getOrder(Request $request){
        // return ["data"=>["name"=>"mohaseem"]];
        $orderData = DB::table('orders')->get();
        if($orderData){
            foreach($orderData as $key=>$val){
                $orderData[$key]->order_details= DB::table('order_details')->where('order_id', $val->id)->get();
            }
        }
        return response()->json(['status' => true, 'data' => $orderData]);
    }
    //Get order By status or order Id
    public function getOrderById(Request $request){
        $id = $request->id;
        $status = $request->order_status;
        $orderData = [];
        if($id){
            $orderData = DB::table('orders')->where('id', $id)->get();

        }
        if($status){
            $orderData = DB::table('orders')->where('order_status', $status)->get();
        }
        if($orderData){
            foreach($orderData as $key=>$val){
                $orderData[$key]->order_details= DB::table('order_details')->where('order_id', $val->id)->get();
            }
        }


        return response()->json(['status' => true, 'data' => $orderData]);
    }
    
    // Get Delayed Order
    public function getDelayedOrder(){
        $orderData = DB::table('orders')->where('delay_status', 1)->get();
        if($orderData){
            foreach($orderData as $key=>$val){
                $orderData[$key]->order_details= DB::table('order_details')->where('order_id', $val->id)->get();
            }
        }
        return response()->json(['status' => true, 'data' => $orderData]);
    }
    // Order API
    public function placeOrder(){
        $json_input = file_get_contents('php://input'); // JSON Input

        $request = "";

        if (!empty($json_input)) {

            $request = json_decode($json_input, TRUE);
        }

        $orders = new Orders;
        $orders->order_number = "OD-00006";
        $orders->order_date = date('Y-m-d H:i:s');
        $orders->etd = date('Y-m-d H:i:s',strtotime('+5 hours'));
        $orders->delivery_address = $request['delivery_address'];
        $orders->billing_address = $request['billing_address'];
        $orders->customer_id = $request['customer_id'];
        $orders->total_qty = $request['total_qty'];
        $orders->total_value = $request['total_value'];
        // $orders->status = 1;
        $orders->order_status = 1;
        $orders->delay_status = 0;
        $orders->save();

        $order_id = $orders->id;
        foreach($request['details'] as $key=>$value){
            $order_details = new order_details;
            $order_details->order_id = $order_id;
            $order_details->item_id = $value['item_id'];
            $order_details->item_quantity = $value['item_quantity'];
            $order_details->item_rate = $value['item_rate'];
            $order_details->item_value = $value['item_value'];
            $order_details->status = 1;
            $order_details->save();
        }
        $increment_id = DB::table('orders')->get();

        $last_id = count($increment_id);

        $last_increment_id = 'OD-'.sprintf('%05d', $last_id);

        DB::table('orders')->where('id', $order_id)->update(['order_number' => $last_increment_id]);




        return response()->json(['status' => true, 'data' => $request,"ETD"=>date('Y-m-d H:i:s',strtotime('+5 hours'))]);
    }

    // Order Status update
    public function updateOrderStatus(){
        $json_input = file_get_contents('php://input'); // JSON Input

        $request = "";

        if (!empty($json_input)) {

            $request = json_decode($json_input, TRUE);
        }
        $id = $request['id'];
        $Orders = new Orders();
	    $Orders = Orders::find($id);
	    $Orders->order_status = $request['order_status'];
	    $Orders->save();
        return response()->json(['status' => true, 'data' => $Orders]);
    }
}
