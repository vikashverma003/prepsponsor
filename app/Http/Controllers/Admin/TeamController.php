<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Team;
use App\AddMember;
use App\Campaign;
use App\Http\Requests\TeamFormRequest;
use App\SponsorPackageOption;
use App\Modal\Sponsor;
use DB;
use App\Mail\OrderShipped;
use App\Yelp_address;
use Response;
use App\Crawl;
use App\yelp_url;
use App\trip_url;
use Goutte\Client;
use Symfony\Component\DomCrawler\Crawler;
use App\Mail\sponsor_email;
use Mail;
use App\sponsor_payment;
use phpseclib\Crypt\RSA;
use phpseclib\Net\SSH2;
require 'vendor/autoload.php';
use Mailgun\Mailgun;
use App\Http\Controllers\Admin\ConnectionController;
use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use App\RejectSponsorhip;

class TeamController extends Controller
{
	public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {

        //$teams = Team::orderBy('id', 'desc')->get();
        $teams = Team::orderBy('id', 'desc')->paginate(15);
    		$data = array(
    			'title'=>'Teams',
    			'teams'=>$teams
    		);
	     	return view('teams.index')->with('data',$data);
    }

    /* for loading the view of the team  */

    public function create(Request $request)
    {

      $spo = SponsorPackageOption::get();
       return view('teams.create', ['spo'=>$spo]);
      // return view('teams.create')->with('spo', $spo);
    }

   /* For storing the team data */

    public function store(Request $request)
    {
         $validatedData = $request->validate([
          'address' => 'required',
          'phone' => 'required',
          'email' => 'required|email',
          'first_name' => 'required',
          'last_name' => 'required',
          'member_participants' => 'required|numeric',
        ]); 
        $add = $request->input('address');
        $members = $request->member_participants;
		
		$groupName = $request->group_name;
		// $LastInsertId= 2;
		// $costum_email=$groupName.$LastInsertId.'@prepsponsor.com';

		// echo $costum_email;
        $team = new Team;
        $team->grouptype = $request->grouptype;
        $team->other_main_activity = $request->other_main_activity;
        $team->group_name = $request->group_name;
        $team->main_activity = $request->main_activity;
        $team->email = $request->email;
        $team->mailing_address = $request->mailing_address;
        $team->address = $request->address;
        $team->member_participants = $request->member_participants;
        $team->first_name = $request->first_name;
        $team->last_name = $request->last_name;
        //$team->mail_add_groupname = $request->email;
		
		
		/***************************************************
			Start Code Add's _1 to a mail_add_groupname_inc or increment the ending number to allow _2, _3, etc
		***************************************************/
		$business_name = preg_replace('/\s+/', '', $groupName);	
		$group_name_without_space = strtolower($business_name);
		
		$mail_add_groupname = $group_name_without_space.'@mail.prepsponsor.com';
		$str = $group_name_without_space.'@mail.prepsponsor.com'; 
		
		// $separator = '_'; 
		// $first = 1;
		// preg_match('/(.+)'.$separator.'([0-9]+)$/', $str, $match);
		// $mail_add_groupname_inc = isset($match[2]) ? $match[1].$separator.($match[2] + 1) : $str.$separator.$first;
		$countGroupName = Team::where('group_name',$groupName)->get()->count();
		$checkif = Team::where('mail_add_groupname',$mail_add_groupname)->get();
		
		if($countGroupName==0){
			$team->mail_add_groupname = $group_name_without_space.'@mail.prepsponsor.com';
		}else{
			$number = $countGroupName+1;
			$mail_add_groupname = $group_name_without_space.$number.'@mail.prepsponsor.com';
			$team->mail_add_groupname = $mail_add_groupname;
			//$team->mail_add_groupname = $mail_add_groupname_inc;
			
		}
		
        $team->phone = $request->phone;
        $team->website_fb_page = $request->website_fb_page;
        $team->plan_name = $request->data;
        $team->save();
       $LastInsertId = $team->id;

      /* for adding the additional teams member */

        $team_member = new AddMember;
        $f = array();
        foreach ($request->member_firstname as $member_firstnames) {
                array_push($f, $member_firstnames);
        }
        $team_member->firstname = json_encode($f);

       $l = array();

      foreach ($request->member_lastname as $member_lastnames) {

        array_push($l, $member_lastnames);
                
        }
       $team_member->lastname = json_encode($l);

       $e = array();

      foreach ($request->member_email as $member_emails) {
                    array_push($e, $member_emails);                  
        }
        $team_member->email = json_encode($e);
        $team_member->teams_id = $LastInsertId;
        $team_member->save();
        //return redirect()->route('teams.compare',['add'=>$add]);
		return redirect('admin/teams')->with('success', 'team created successfully.');
    }

      /* for yelp request */

    public function fetch_yelp_data($location)

    {
        // for getting the api key and and the url
        $yelp_urls = yelp_url::first();
        $url_content =$yelp_urls->url;
        $key_content =$yelp_urls->key;
        $request_url = $url_content.'?'.'location'.'='.$location;
        $api_key =$key_content;
        // Send Yelp API call
        $ch = curl_init($request_url);
        curl_setopt($ch, CURLOPT_HTTPHEADER,
            array(
                "Content-Type: application/json",
                "Authorization: Bearer ".$api_key
        ));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        $data = curl_exec($ch); // Yelp response
        curl_close($ch);
        // Handle Yelp response data
        $response = json_decode($data);
        $all_content =$response->businesses;
        return $all_content;

    }

    /* for showing the team listing */

    public function show($id)
    {
        $teams = Team::find($id);
        // $additional_member = AddMember::where('teams_id', $id)->first('firstname');
        $additional_member = AddMember::where('teams_id', $id)->first();

        // return view('teams.show')->with('data',$teams);
         return view('teams.show', ['data'=>$teams, 'additional_member'=>$additional_member]);
    }

    /* for editing the team */
    public function edit($id)
    {
        // echo $id;
        $team_data = Team::find($id);

        return view('teams.edit')->with('team_data', $team_data);
    }

    public function update(Request $request, $id)
    {
        // print_r($request->all());
        // die;
       $team_data = Team::find($id);       
       $team_data->group_name = $request->group_name;
       $team_data->address = $request->address;
       $team_data->phone = $request->phone;
       $team_data->email = $request->email;
       $team_data->main_activity = $request->main_activity;
       $team_data->first_name = $request->first_name;
       $team_data->last_name = $request->last_name;
       $team_data->member_participants = $request->member_participants;
       $team_data->mail_add_groupname = $request->mail_add_groupname;
       $team_data->title = $request->title;
       $team_data->website_fb_page = $request->website_fb_page;
       $team_data->save();
       // return back()->with('success', 'updation has been done successfully.');
        return redirect('admin/teams/')->with('success', 'updation has been done successfully');
    }

    /* for deleting the team */
    public function destroy(Request $request, $id)
   {
       $team = Team::find($id);
       $team->delete();
       return redirect('admin/teams/')->with('success', 'Deletion has been done successfully');
   }


   public function tripadvisor_crawling(Request $request)
   {
        // $trip = trip_url::find(1);
        // $url= $trip->url;
    $url = "https://www.tripadvisor.in/Restaurant_Review-g32655-d2236163-Reviews-Figueroa_Philly_Cheese_Steak-Los_Angeles_California.html";
        $client = new Client();
        $crawler = $client->request('GET', $url);
        $links_count = $crawler->filter('a')->count();
        $all_links = [];
        if($links_count > 0){
            $links = $crawler->filter('a')->links();
            // dd($links);
            // $d = $links['130'];
            // echo $d;
            foreach ($links as $link) {
                $all_links[] = $link->getURI();
                // $crawl = new Crawl;
            }
               
            $all_links = array_unique($all_links);
            // dd($all_links);
            echo "All Avialble Links From this page $url Page<pre>"; print_r($all_links);echo "</pre>";

        } else {

            echo "No Links Found";

        }
   }

   public function editPackage(Request $request, $id)
   {

  
    $spo = SponsorPackageOption::find($id);
    return view('packageEdit')->with('spo', $spo);
    // return view('packageEdit', ['spo'=>$spo, 'sponsor_amount'=>$sponsor_amount]);

   }


   public function editPackageUpdate(Request $request, $id)
   {
    
     $spo = SponsorPackageOption::find($id);
     $spo->tier_name = $request->tier_name;
     $spo->active = $request->active;
     $spo->description = $request->description;
     $spo->sponsor_amount = $request->sponsor_amount;
     $spo->slot_available = $request->slot_available;
     $spo->Total = $request->total;

     $spo->save();
   // return view('packageEdit')->with('spo', $spo);
     return redirect('admin/teams/create')->with('success', 'package has been updated successfully');
    
   }

   public function teamsTransaction(Request $request)
   {
    $sponsor_payment = sponsor_payment::get();
    $sponsor_payment_count = sponsor_payment::get()->count();

    for($i=0;$i<$sponsor_payment_count; $i++)
    {
              $team = Team::where('id', $sponsor_payment[$i]['team_id'])->first(['grouptype', 'main_activity']);

               $sponsor_payment[$i]['grouptype']=  $team['grouptype'];
                 $sponsor_payment[$i]['main_activity']=  $team['main_activity'];

    }
	//$d= $sponsor_payment->paginate(15)->toArray();print_r($d);die();
    return view('teamsTransaction')->with('sponsor_payment', $sponsor_payment);

   }
   
    public function emailCompaign(Request $request)
   {

    $teamsEmail  = Team::orderBy('id', 'desc')->paginate(15);

    return view('teams/launchCompaign')->with('data', $teamsEmail);

   }

    public function startEmailCompaign(Request $request, $id)
   {
    $teamsEmail  = Team::where('id', '=', $id)->first();
	$teams_custom_email = $teamsEmail->mail_add_groupname;
	$teams_real_email = $teamsEmail->email;
    $teams_zipcode =  $teamsEmail->address;
	
	$all_zipcodes= $teams_zipcode +10;
	$k=array();
	while($teams_zipcode<$all_zipcodes)
	 {
		array_push($k, $teams_zipcode);	
		$teams_zipcode++;
	  }   
    $sponsorsEmail  = Yelp_address::whereIn('location',$k)->get();
    $sponsors_count  = Yelp_address::whereIn('location',$k)->get()->count();
	
	$teamsInfo = [
            "first_name"=>$teamsEmail['first_name'],
            "last_name"=>$teamsEmail['last_name'],
             "group_name"=>$teamsEmail['group_name'],
              "member_participants"=>$teamsEmail['member_participants'],
              "main_activity"=>$teamsEmail['main_activity'],
             "phone"=>$teamsEmail['phone'],
              "main_activity"=>$teamsEmail['main_activity']
             
                  ];
	$groupName =$teamsEmail->group_name;
	$firstName =$teamsEmail->first_name;
	$groupId =$teamsEmail->id;
	/* Getting the business & team unique email address */
	if($sponsors_count>=1)
	{
	foreach($sponsorsEmail as $sponsorsEmails)
	{
		//$teams_email_fake= $groupName.'+'.$sponsorsEmails->id.'@mail.prepsponsor.com';
		$teams_email_fake= $teams_custom_email;	
		//$business_name = preg_replace('/\s+/', '', $sponsorsEmails->business_name);	
		$business_name = preg_replace("/[^a-zA-Z0-9\s]/", "", $sponsorsEmails->business_name);
		$business_name_email = strtolower($business_name);
		//echo $sponsorsEmails->email;
		//die();
		$business_emails_fake =$business_name_email.$teamsEmail->id.'@mail.prepsponsor.com';
		$rejected_sponsor = RejectSponsorhip::where('team_id', '=', $id)->where('sponsor_id', '=', $sponsorsEmails->id)->first();
		if(empty($rejected_sponsor))
		{
			 if(!empty($sponsorsEmails->email))
			{
				if($sponsorsEmails->zerobounce_test==1)
				{
				$domain = "mail.prepsponsor.com";
				$mgClient = Mailgun::create('key-4jivaqojc4vf52agjv78qjd189rvi6w5','https://api.mailgun.net/v3');
				//$email_team = "dummygroup345@mail.prepsponsor.com";
				$email_team=$teams_email_fake;
				$email_team_real = $teams_real_email;
				$expression   = "match_recipient('$email_team')";
				$actions      = array("forward('$email_team_real')", 'stop()');
				$description  = 'Catch All and Forward';
				$result = $mgClient->routes()->create($expression, $actions, $description);
				
				$mgClient = Mailgun::create('key-4jivaqojc4vf52agjv78qjd189rvi6w5','https://api.mailgun.net/v3');
				//$email_sponsor = "dummySponsor345@mail.prepsponsor.com";
				$email_sponsor=$business_emails_fake;
				$email_sponsor_real = $sponsorsEmails->email;
				$expression   = "match_recipient('$email_sponsor')";
				$actions      = array("forward('$email_sponsor_real')", 'stop()');
				$description  = 'Catch All and Forward';
				
				$result = $mgClient->routes()->create($expression, $actions, $description);
				
				// handle campaining data
				$campaign = Campaign::where('teams_id','=', $id)->first();
				if($campaign)
				{
				  $campaign = Campaign::where('teams_id','=', $id)->where('sponsors_real_email','=', $email_sponsor_real)->delete();

				}			
				$campaign = new Campaign;
				$campaign->teams_id=$groupId;
				$campaign->teams_custom_email=$email_team;
				$campaign->teams_real_email=$email_team_real;
				$campaign->sponsors_custom_email=$email_sponsor;
				$campaign->sponsors_real_email=$email_sponsor_real;
				$campaign->sponsor_name=$business_name;
				$campaign->text="some dummy text";
				$campaign->save();
				
						
					$team_id=['id'=>$id,
								'group_name'=>$teamsEmail['group_name'],
								"first_name"=>$teamsEmail['first_name'],
								"sponsors_id"=>$sponsorsEmails['id'],
								"last_name"=>$teamsEmail['last_name'],
								"phone"=>$teamsEmail['phone'],
								 "member_participants"=>$teamsEmail['member_participants'],
											   "main_activity"=>$teamsEmail['main_activity'],

								 "mailing_address"=>$teamsEmail['mailing_address'],
								'description'=>"here we are testing the logs"
						];
				$html = view('sponsor-email-template', $team_id)->render();
				$mgClient1 = Mailgun::create('key-4jivaqojc4vf52agjv78qjd189rvi6w5');
					   $domain = "mail.prepsponsor.com";
					   $mgClient1->messages()->send($domain, [
						'from'    => $email_team,
						  'to'      =>  $email_sponsor, 
						  'subject' => 'Regarding sponsorship!',
						  'html' => $html,
						 ]);

						$log=[
						'team_id'=>$id,
						'teams_custom_email'=>$email_team,
								'sponsors_custom_email'=>$email_sponsor,
								'teams_real_email'=>$email_team_real,
								'sponsors_real_email'=>$email_sponsor_real,
								'subject' => 'Regarding sponsorship!',
								'text'    => 'Here is Your generous sponsorship allows us to support over .Here we are testing the sponsor email'
								
						];
						
						$sponsorLog = new Logger('SponorsEmail');
						$sponsorLog->pushHandler(new StreamHandler(storage_path('logs/SponsorEmail-2020-02-14.log')), Logger::INFO);
						$sponsorLog->info('SponsorLogger', $log);
					//var_dump($result);
				//	echo "<br>";	
			}
			elseif($sponsorsEmails->zerobounce_test==NULL){
				return redirect('admin/emailCompaign')->with('er_status', "Need to validate through Zerobounce test");;

			}
			}			
		}
	}
	   return redirect('admin/emailCompaign')->with('su_status', "Emails have been sent successfully");;
	}
	else
	{
     return redirect('admin/emailCompaign')->with('er_status', "no sponsors found");;

	}
   }
   
   
   public function read_log(Request $request){
	   //laravel-2020-02-21.log
		 // from PHP documentations
		  $logFile = file(storage_path().'/logs/laravel-2020-02-25.log');
		  $logCollection = [];
		  // Loop through an array, show HTML source as HTML source; and line numbers too.
		  
		 foreach ($logFile as $line_num => $line) {
			 $logCollection[] = array('line'=> $line_num, 'content'=> htmlspecialchars($line));
		  } 
		   /* foreach ($logFile as $line) {
			   
			// $logCollection[] = $line;
			  $logCollection[] = $line;
		  } */
		  //echo "<pre>";
		 // print_r($logCollection);
		  //die();
		  dd($logCollection);

   }

   public function check_logs(Request $request, $id){
	   
	   			$campaign_data = Campaign::where('teams_id', '=', $id)->get();
				return view('logs_view')->with('campaign_data', $campaign_data);
				
   }
   
   public function teams_logs(Request $request)
   {
			 $campaign_data = DB::table('teams')
            ->join('campaigns', 'teams.id', '=', 'campaigns.teams_id')
            ->select('teams.*', 'campaigns.teams_custom_email', 'campaigns.sponsors_custom_email','campaigns.teams_real_email','campaigns.sponsors_real_email','campaigns.created_at', 'campaigns.sponsor_name','campaigns.id')
			->orderBy('campaigns.id', 'desc')
			->get();			  
			 return view('teams_log')->with('campaign_data', $campaign_data);
   }
   
   
   
   public function test_forwarding_emails(Request $request)
   {		
			$d=468;
			$team_id=['id'=>$d,
							'description'=>"here we are testing the logs"
					];
			$html = view('mail', $team_id)->render();

	        $mgClient1 = Mailgun::create('key-4jivaqojc4vf52agjv78qjd189rvi6w5');
                   $domain = "mail.prepsponsor.com";
				   $mgClient1->messages()->send($domain, [
					// 'from'    => $email_team,
					  //'to'      =>  $email_sponsor, 
					  'from'    => 'vikas.auspicioussoft@gmail.com',
					  'to'      =>  'vikas@cybersify.tech',
					  'subject' => 'Regarding sponsorship!',
					 'text'    => 'Here is Your generous sponsorship allows us to support over .Here we are testing the sponsor email',
					  'o:tracking-opens' => 'yes'
					 // 'html' => $html,
					]);					
					echo "email has been sent";
					
					# Instantiate the client.			   	   
   }
   
   
   public function crawalWebsiteData()
   {
	   			$key = new RSA();
				$key->loadKey(file_get_contents('/var/www/app.prepsponsor.com/presponsor2.ppk'));				
				$ssh = new SSH2('3.84.12.222');
				if (!$ssh->login('ubuntu', $key)) {
					exit('Login Failed');
				}
				else
				{
				   $command = 'cd /var/www/app.prepsponsor.com/python_new && python3 app.py --name="the grilled cheese truck" --city="Los Angeles" 2>&1';
				   echo $command ."<br>"; 
				  $output =$ssh->exec($command);
					print_r($output);
				}
   }



}