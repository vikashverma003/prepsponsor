<?php

use Illuminate\Http\Request;
use App\logFile;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => 'api-header'], function () {
  
});

	Route::post('addTeam', 'API\UserController@addTeam');


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



Route::post('inbound-mail',function(Request $request){
	
           Log::info($request->all());

		  // $get_data = $request->all();
		  // $log_file= new logFile; 
		  
		 /*
		   //$log_file->sender= $request->envelope->sender;
		   $sender = $get_data['envelope']['sender'];
		   $log_file->sender=  $sender;
		   //$log_file->targets= $request->envelope->targets;
		   $target = $get_data['envelope']['targets'];
		   $log_file->targets= $target;
		  // $log_file->to= $request->message->headers->to;
		   $to = $get_data['message']['headers']['to'];
		   $log_file->to=  $to;
		   //$log_file->from= $request->message->headers->from;
		   $from =$get_data['message']['headers']['from'];
		   $log_file->from= $from;
		  // $log_file->subject= $request->message->headers->subject;
		  $subject =$get_data['message']['headers']['subject'];
		   $log_file->subject= $subject;
		  // $log_file->event= $request->event;
		  $event =$get_data['event'];
		   $log_file->event= $event;
		   //$log_file->message_status= $request->delivery->status->message;
		   $msg_status=$get_data['delivery']['status']['message'];
		   $log_file->message_status= $msg_status; 
		   $log_file->save(); */
		   
		          // app('log')->debug(request()->all());

            return response()->json(['status' => 'ok']);
});

Route::any('edit-package/{id}', 'API\UserController@editPackage');
Route::post('/update-package/{id}', 'API\UserController@updatePackage'); 


Route::get('getContent', 'API\UserController@getContent');

// Route::post('getSponsors', 'API\UserController@getSponsors');


Route::any('getSponsors/{zipcode}', 'API\UserController@getSponsors');


/***************** Txt File *************************/
Route::any('store_txt_file', 'API\UserController@storeTxtData');
/***************** End Txt File *************************/

Route::get('/crawalWebsiteData/{businessName}/{city}', 'API\UserController@crawalWebsiteData');

Route::post('addMember', 'API\UserController@addMember');

// Route::post('addTeam', 'API\UserController@addTeam');

Route::get('selectPackage', 'API\UserController@SponsorPackageOption');

Route::group([
    'prefix' => 'mailgun',
    
],function () {
    Route::post('widgets', 'MailgunWidgetsController@store');
});


Route::post('login', 'API\UserController@login');
Route::post('register', 'API\UserController@register');
Route::group(['middleware' => 'auth:api'], function(){
Route::post('details', 'API\UserController@details');
});