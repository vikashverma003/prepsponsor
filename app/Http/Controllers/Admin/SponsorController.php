<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Modal\Sponsor;
use App\Http\Requests\TeamFormRequest;
use Log;
use App\Team;
use Illuminate\Support\Facades\Mail;
use App\Mail\OrderShipped;
use Monolog\Logger;
use App\yelp_test;
use App\Yelp_address;
use DB;
require 'vendor/autoload.php';
use Mailgun\Mailgun;

class SponsorController extends Controller
{
	public function __construct()
    {
        $this->middleware('auth:admin');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Yelp_address::orderBy('id', 'desc')->paginate(15);
		return view('admin.sponsors.sponsor_index')->with('data',$data);
		// return view('admin.sponsors.index')->with('data',$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function sendEmail(Request $request)
    {

      $data1 = [
           'data' => "sdsd",
           'password' => "aaaaa",
           'link'=>"https://www.twilio.com/docs/usage/webhooks/getting-started-twilio-webhooks"
       ];
        $mgClient = Mailgun::create('1a0941a6b0534bb0b146bdf25dd6e7e3-a9919d1f-57660409');
        $domain = "sandboxf3a043df953e4f23a04f29f0ee359982.mailgun.org";
        $mgClient->messages()->send($domain, [
          'to'      => 'vikas@cybersify.tech',
          'subject' => 'another testwer!',
          'text'    => 'another testwer xcvxcvxcvcv!'
        ]);

    }
      public function allSponsors(Request $request, $teamStrength, $zipcode)
      {
		  $all_zipcodes= $zipcode +10;
			$k=array();
			while($zipcode<$all_zipcodes)
			 {
				array_push($k, $zipcode);	
				$zipcode++;
			  }
		  
          $sponser = Yelp_address::whereIn('location',  $k)->get();
          return view('admin.sponsors.mailing')->with('data', $sponser);
    }
    public function create()
    {
        return view('admin.sponsors.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
		// $sponsorData = request()->all();
		// $sponsor = Sponsor::create($sponsorData);
      $address = $request->input('yelp_address');
      $trip_email = $request->trip_advisor_email;
      $websiteEmail = $request->website_email;

      $sponsor_name = $request->sponsor_name;
           $sponsor = new Sponsor;
           $sponsor->yelp_address = $request->yelp_address;
           // $sponsor->lat = $output->{'results'}[0]->{'geometry'}->{'location'}->{'lat'};
           // $sponsor->lng = $output->{'results'}[0]->{'geometry'}->{'location'}->{'lng'};
           $sponsor->sponsor_name = $request->sponsor_name;
           $sponsor->category = $request->category;
           $sponsor->yelp_website = $request->yelp_website;
           $sponsor->trip_advisor_email = $request->trip_advisor_email;
           $sponsor->yellow_pages_email = $request->yellow_pages_email;
           $sponsor->website_email = $request->website_email;
           $sponsor->whoIs_email = $request->whoIs_email;
           $sponsor->manually_email = $request->manually_email;
           $sponsor->team_id = $request->team_id;
           $sponsor->unsubscribe_date = $request->unsubscribe_date;
           $sponsor->sponsorship_tier = $request->sponsorship_tier;
           $sponsor->sponsorship_amount = $request->sponsorship_amount;
           $sponsor->sponsorship_date = $request->sponsorship_date;
           $sponsor->save();

         // Mail::to($trip_email)->send(new OrderShipped());

           $data1 = [
           'sponsor_name' => $sponsor_name,
           'contact_email' =>$websiteEmail
       ];

      Mail::send(['text'=>'mail'], $data1, function($message){

        $message->to('fnvg@gmail.com', 'to fumes')->subject('test email');
        $message->from('bitfumes@gmail.com', 'bitfumes');
      });

	   	// Log::useFiles(storage_path().'/logs/mycustom1.log');
		  // Log::info('Create Sponsor:');

        // Log::emergency('We have some details of the sponsors and The address is!'.$address ." and the mail is ".$trip_email);

      Log::channel('single')->info("the adress is ". $address ." the name is ".$sponsor_name);

		return back()->with('success', 'Sponsor created successfully.');
    }
	
	
	public function get_trip($id)
	{
		 
		 $get_trip_data = Yelp_address::where('id', '=',$id)->first();//echo "<pre>";//print_r(json_decode($get_trip_data['yelp_data']),false);die();
		 
		 $additional_data=json_decode($get_trip_data['yelp_data']);
		
		 return view('admin.sponsors.get_trip',['get_trip_data'=>$get_trip_data,'additional_data'=>$additional_data]);
	}
	
	public function get_yellow_page($id)
	{
		$get_yellow_data = Yelp_address::where('id', '=',$id)->first();
	   $additional_data=json_decode($get_yellow_data['yelp_data']);
		 return view('admin.sponsors.get_yellow_page', ['get_yellow_data'=>$get_yellow_data,'additional_data'=>$additional_data]);
	}
	
	
	public function sponsor_view()
	{
		 $team = Team::get();
		return view('admin.sponsors.sponsor_view')->with('team', $team);
	}
	
	public function sponsor_view_store(Request $request)
	{
		// echo 234;
        $sponsor_data = new Yelp_address;
		$sponsor_data->business_name = $request->input('business_name');
		$sponsor_data->city = $request->input('city');
		$sponsor_data->location = $request->input('location');
		$sponsor_data->phone = $request->input('phone');
		$sponsor_data->address = $request->input('address');
		$sponsor_data->email = $request->input('email');
		$sponsor_data->save();		
		return redirect('/admin/sponsors')->with('success', 'Sponsor created successfully.');
		
	}
	
	public function sponsor_view_edit($id){
		
		 $sponsor_data =  Yelp_address::where('id', '=', $id)->first();

		return view('admin.sponsors.sponsor_view_edit')->with('sponsor_data', $sponsor_data);
				
	}
	
	
	public function sponsor_view_update(Request $request, $id){
		 
		 $sponsor_data =  Yelp_address::where('id', '=', $id)->first();
		 $sponsor_data->business_name=$request->business_name;
		 $sponsor_data->city=$request->city;
		 $sponsor_data->location=$request->location;
		 $sponsor_data->phone=$request->phone;
		 $sponsor_data->email=$request->email;
		 $sponsor_data->address=$request->address;
		 $sponsor_data->save();
		 return redirect('admin/sponsors');
		

	}
	
	
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
       $sponsor = Sponsor::find($id);
       
      return view('admin.sponsors.show')->with('data', $sponsor);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $sponsor = Sponsor::find($id);

        return view('admin.sponsors.edit')->with('sponsor', $sponsor);


    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
      
      $sponsor = Sponsor::find($id);

       $sponsor->yelp_address = $request->yelp_address;
           // $sponsor->lat = $output->{'results'}[0]->{'geometry'}->{'location'}->{'lat'};
           // $sponsor->lng = $output->{'results'}[0]->{'geometry'}->{'location'}->{'lng'};
           $sponsor->sponsor_name = $request->sponsor_name;
           $sponsor->category = $request->category;
           $sponsor->yelp_website = $request->yelp_website;
           $sponsor->trip_advisor_email = $request->trip_advisor_email;
           $sponsor->yellow_pages_email = $request->yellow_pages_email;
           $sponsor->website_email = $request->website_email;
           $sponsor->whoIs_email = $request->whoIs_email;
           $sponsor->manually_email = $request->manually_email;
           $sponsor->team_id = $request->team_id;
           $sponsor->unsubscribe_date = $request->unsubscribe_date;
           $sponsor->sponsorship_tier = $request->sponsorship_tier;
           $sponsor->sponsorship_amount = $request->sponsorship_amount;
           $sponsor->sponsorship_date = $request->sponsorship_date;
           $sponsor->save();
           return back()->with('success', 'Sponsors has been updated successfully.');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
		    $sponsor = Sponsor::find($id);
        $sponsor->delete();
        return redirect('admin/sponsors/')->with('success', 'Deletion has been done successfully');

    }
}
