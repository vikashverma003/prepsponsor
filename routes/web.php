<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use Goutte\Client;
use GuzzleHttp\Client as GuzzleClient;
use App\Yelp_address;

// for Queue and jobs
use App\Mail\newEmail;
use Illuminate\Support\Facades\Mail;

use App\jobs\SendEmailJob;
use Carbon\Carbon;
use App\Mail\OrderShipped;

    Route::view('/', 'app');



// Route::get('/', function () {
  //  return view('auth.login');
	
	 // return view('welcome');
// });

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

// for AWS email testing
Route::get('testing', function () {
      Mail::to('vikas.auspicioussoft@gmail.com')->send(new OrderShipped());
});


	 Route::get('/test_forwarding_emails', 'Admin\TeamController@test_forwarding_emails');



Route::prefix('admin')->group(function () {
	Route::get('/login', 'Auth\AdminLoginController@showLoginForm')->name('admin.login'); 
	Route::post('/login', 'Auth\AdminLoginController@login');
	Route::get('/dashboard', 'Admin\AdminController@dashboard')->name('admin.dashboard');

	Route::resource('/teams', 'Admin\TeamController');
    Route::get('teams/{id}/delete', ['as' => 'teams.delete', 'uses' => 'Admin\TeamController@destroy']);
    Route::get('teams/{id}/show', ['as' => 'teams.show', 'uses' => 'Admin\TeamController@show']);
	
	 Route::get('/crawalWebsiteData', 'Admin\TeamController@crawalWebsiteData');
   
    // for editing form package
    Route::get('/editPackage/{id}', 'Admin\TeamController@editPackage');
    Route::post('/editPackage/{id}/update', 'Admin\TeamController@editPackageUpdate');

    // for crawling
     Route::get('/tripadvisor_crawling', 'Admin\TeamController@tripadvisor_crawling');
	 Route::get('/emailCompaign', 'Admin\TeamController@emailCompaign');
	 Route::get('teams/{id}/startEmailCompaign', ['as' => 'teams.startEmailCompaign', 'uses' => 'Admin\TeamController@startEmailCompaign']);
     Route::get('teams_logs', 'Admin\TeamController@teams_logs');


    // for new form
    	//Route::resource('/teams1', 'Admin\TeamController');
    Route::resource('/sponsors', 'Admin\SponsorController');
	
	Route::get('/sponsor_view', 'Admin\SponsorController@sponsor_view');
    Route::post('/sponsor_view/store', 'Admin\SponsorController@sponsor_view_store');
	Route::get('/sponsor_view/sponsor_view_edit/{id}', 'Admin\SponsorController@sponsor_view_edit');
    Route::post('/sponsor_view/sponsor_view_update/{id}', 'Admin\SponsorController@sponsor_view_update');
	/* check logs */
	Route::get('/check_logs/{id}', 'Admin\TeamController@check_logs');

     Route::get('/read_log', 'Admin\TeamController@read_log');
     // for all sponsors
    Route::get('sponsors/{id}/show', ['as' => 'sponsors.show', 'uses' => 'Admin\SponsorController@show']);
	Route::get('sponsors/{id}/delete', ['as' => 'sponsors.delete', 'uses' => 'Admin\SponsorController@destroy']);
	Route::get('sponsors/{id}/get_trip', ['as' => 'sponsors.get_trip', 'uses' => 'Admin\SponsorController@get_trip']);
    Route::get('sponsors/{id}/get_yellow_page', ['as' => 'sponsors.get_yellow_page', 'uses' => 'Admin\SponsorController@get_yellow_page']);

    // all sponsors with zipcode
    Route::get('/allSponsors/{teamStrength}/{zipcode}', 'Admin\SponsorController@allSponsors');
    // for packages.

    Route::resource('/package', 'PackageController');

    Route::get('package/{id}/delete', ['as' => 'package.delete', 'uses' => 'PackageController@destroy']);

    Route::get('/selectPackage/{id}/{sponsor_id}', 'PackageController@selectPackage');
    Route::get('/teams_package', 'PackageController@teams_package');
    Route::get('/teams_package/{id}/edit', ['as'=>'teams_package.edit',   'uses'=>'PackageController@teams_package_edit']);
	Route::post('/teams_package/{id}/update', ['as'=>'teams_package.update',   'uses'=>'PackageController@teams_package_update']);

    Route::get('/teamsTransaction', 'Admin\TeamController@teamsTransaction');
	
	Route::get("addmoney/stripeDonation/{id}/{sponsor_id}", array("as" => "addmoney.payWithStripeDonation","uses" => "AddMoneyController@payWithStripeDonation"));

Route::get("addmoney/stripe/{id}/{sponsor_id?}", array("as" => "addmoney.paywithstripe","uses" => "AddMoneyController@payWithStripe"));
Route::post("addmoney/stripe/{id}/{sponsor_id?}", array("as" => "addmoney.stripe","uses" => "AddMoneyController@postPaymentWithStripe"));

/******** for modalname controller ***********/
Route::get('/key_data/{web_address}', 'ModelnameController@key_data');
Route::get('/zerobounce_test/{email}', 'ModelnameController@zerobounce_test');
Route::get('/zerobounce_check', 'ModelnameController@zerobounce_check');
Route::get('/zerobounce_validation/{id}', 'ModelnameController@zerobounce_validation');
Route::get('/whois_list', 'ModelnameController@whois_list');
Route::get('/collect_whois_data/{id}', 'ModelnameController@collect_whois_data');
});	

Route::get('/sendEmail', 'Admin\SponsorController@sendEmail');
Route::get('/domainName', 'ModelnameController@domainName');

Route::get('/compare/{add}',  'Admin\TeamController@compare');
Route::get('/calDis/{address}', 'Admin\TeamController@calDistance');

Route::get('/crawler', 'ModelnameController@index');
Route::get('/fetch_yelp/{location}', 'ModelnameController@fetch_yelp');
Route::get('/fetch_count/{location}', 'ModelnameController@fetch_count');

Route::get("thank_you/sponsor/{id}", array("as" => "thank_you.sponsor","uses" => "PackageController@thank_you_page"));

/* test the email template */

Route::get('/sendMail2', 'ModelnameController@sendMail2');

Route::get('/test', function(){

	return view('test');

});


Route::get('/emailJobs', function(){
$job = (new SendEmailJob())
                            ->delay(Carbon::now()->addSeconds(5));
    dispatch($job);
    return "job has been sent ";
});


