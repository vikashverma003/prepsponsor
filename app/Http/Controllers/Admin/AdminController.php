<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\User;
use App\Property;
use View;

class AdminController extends Controller
{
	
	  // public function __construct()
   //  {
   //      $this->middleware('auth:admin');
   //  }

	
	public function dashboard(){

		return View('admin.dashboard');
	}
	
	public function updateStatus(Request $request)
    {
        $user_id = $request->get('user_id');
        $status = $request->get('status');
      
        $user = User::find($user_id);
        $user->user_status = $status;
        $user->save();

        $data['msg'] = 'User status update';
        $data['status'] = $status;
        echo json_encode($data);        
        exit;
    }	
	
	public function getProperty(Request $request){
		$data = array();
		$data['properties'] = Property::paginate('10');
		$data['title'] = 'Admin | Property';
		return View('admin.viewProperty',$data);
	}
	
	public function getPropertyDetail($id){
		//print_r($id);	die;
		$property = Property::find($id);
		$data = array();
		$data['property'] = $property;
		$data['title'] = 'Admin | Property';
		return View('admin.propertyDetail',$data);
	}
}
