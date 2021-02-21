<?php
namespace App\Http\Controllers\API;
//ini_set('max_execution_time', 60);
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use App\User; 
use Illuminate\Support\Facades\Auth; 
use Validator;
use App\Yelp_address;
use Response;
use App\Crawl;
use App\yelp_url;
use App\trip_url;
use Goutte\Client;
use App\Team;
use App\SponsorPackageOption;
use phpseclib\Crypt\RSA;
use phpseclib\Net\SSH2;
use App\AddMember;
use File;
use DB;
use Log;
set_time_limit(0);
class UserController extends Controller 
{
public $successStatus = 200;
/** 
     * login api 
     * 
     * @return \Illuminate\Http\Response 
     */ 

	public function getSponsors(Request $request, $zipcodes)
	{
			$response = array("status" => 0, "msg" => "Validation error");
			$rules = [
			      // 'zipcode' => 'required',
			      // 'team_size'=> 'required',    
			  ];
			$messages = array( 
			      // 'zipcode.required' => 'location is required ', 
			       // 'team_size.required' => 'team_size is required ', 
			  );

			$validator = Validator::make($request->all(), $rules, $messages);
			if ($validator->fails()) {
			      $message = '';
			      $messages_l = json_decode(json_encode($validator->messages()), true);
			      foreach ($messages_l as $msg) {
			          $message .= $msg[0] . ", ";
			    }
			    $response['msg'] = $message;
			} else {
				 $count=0;
				 $zipcode = $zipcodes;		 
				 if(!empty($zipcode))
				 { 
				$data= array();
				$location_array = array();
				$count=0;		
				
					$check_zipcode = Yelp_address::where('location',  $zipcode)->first();
					$key = new RSA();
					$key->loadKey(file_get_contents('/var/www/app.prepsponsor.com/presponsor2.ppk'));
					
					//Remote server's ip address or hostname
					$ssh = new SSH2('3.84.12.222');

					if (!$ssh->login('ubuntu', $key)) {
						exit('Login Failed');
					}
					
				else
				{
					
					    $all_zipcodes=$zipcodes+5;
						$k=array();
						while($zipcodes<$all_zipcodes)
						{
							array_push($k, $zipcodes);	
							$zipcodes++;
						}
						$start=end($k);
						$last_five_zipcode=end($k)+5;
						$l=array();
						while($start<$last_five_zipcode)
						{
							array_push($l, $start);	
							$start++;
						}
						//print_r($k);die();
					$yelp_address_check = Yelp_address::where('location',  $zipcode)->first();
					if(empty($yelp_address_check))
					{
						$command = 'cd ../../var/www/app.prepsponsor.com/python_new && python3 app.py --zip_code_or_city="'.$zipcode.'" --zip_range="15"';
						$output =$ssh->exec($command);
						sleep(10);
					}
				    //  $all_zipcodes= $zipcodes +10;				        					
				    //$yelp_address_exist = Yelp_address::where('location',  $zipcode)->get();
					// echo 232;
				    //$yelp_address_exist = Yelp_address::whereIn('location',  $k)->get();
					$yelp_address_exist=array();
				    $yelp_address_exist_check_count = Yelp_address::whereIn('location',  $k)->get()->count();
					
					if($yelp_address_exist_check_count>=1){
					  //$yelp_address_exist = Yelp_address::whereIn('location',  $k)->get();
					  $yelp_address_zerobounce = Yelp_address::whereIn('location',  $k)->get();
					   foreach($yelp_address_zerobounce as $yelp_address_exists)
					   {
						   Log::channel('sponsors')->info($yelp_address_exists);
						   $email=$yelp_address_exists->email;
		                   $id=$yelp_address_exists->id;
						   if(!empty($email)){
							$check=$this->zerobounce_test($email);
							$json = json_decode($check);
							$zerobounce_log=['business_name'=>$yelp_address_exists['business_name'],'email'=>$yelp_address_exists['email'], 
							'status'=>$json->status
							];
							$encode_zerobounce_log=json_encode($zerobounce_log);
							Log::channel('zerobounce_email')->info($encode_zerobounce_log);
							//Log::info($check);
							//echo $json->status;die();
							if($json->status=='valid'){
								$yelp_address_exist[]=array(
								'business_name'=>$yelp_address_exists['business_name'],
								'city'=>$yelp_address_exists['city'],
								'phone'=>$yelp_address_exists['phone'],
								'email'=>$yelp_address_exists['email'],
								'latitude'=>$yelp_address_exists['latitude'],
								'longitude'=>$yelp_address_exists['longitude'],								
								);							
							}
						   }  
					   }
					   //echo $zipcode;die();
					   //print_r((object)$yelp_address_exist);die();
					}
					else{
					   //$yelp_address_exist = Yelp_address::whereIn('location',  $l)->get();
					   $yelp_address_zerobounce = Yelp_address::whereIn('location',  $l)->get();
					   foreach($yelp_address_zerobounce as $yelp_address_exists)
					   {
						   Log::channel('sponsors')->info($yelp_address_exists);
						   $email=$yelp_address_exists->email;
		                   $id=$yelp_address_exists->id;
						   if(!empty($email)){
							$check=$this->zerobounce_test($email);
							$json = json_decode($check);
							$zerobounce_log=['business_name'=>$yelp_address_exists['business_name'],'email'=>$yelp_address_exists['email'], 
							'status'=>$json->status
							];
						   $encode_zerobounce_log=json_encode($zerobounce_log);
							Log::channel('zerobounce_email')->info($encode_zerobounce_log);
							//Log::info($json);
							//echo $json->status;die();
							if($json->status=='valid'){
								
								$yelp_address_exist[]=array(
								'business_name'=>$yelp_address_exists['business_name'],
								'city'=>$yelp_address_exists['city'],
								'phone'=>$yelp_address_exists['phone'],
								'email'=>$yelp_address_exists['email'],
								'latitude'=>$yelp_address_exists['latitude'],
								'longitude'=>$yelp_address_exists['longitude'],								
								);							
							}
						   }  
					   }
					}
										//echo "<pre>";print_r($yelp_address_exist);die();

					}
				$response = array("status" => 1, "msg"=>"Sponsors list ", "sponsors" =>$yelp_address_exist);
				
    }
		else
		{	
			$response = array("status" => 0, "msg"=>"Zipcode required ");
			
		}
		}
    return $this->return_response($response);

	}
	
	public function zerobounce_test($email){				
				//$url = 'https://api.zerobounce.net/v2/validate?api_key=c9eed44c17f84432a5429d706852a9b4&email=' . urlencode('flowerjill@aol.com') . '&ip_address=' . urlencode('99.110.204.1');
				$url = 'https://api.zerobounce.net/v2/validate?api_key=3ab4654de0ad435293eb9af2003bee44&email=' . urlencode($email) . '&ip_address=' . urlencode('99.110.204.1');
				//PHP 5.5.19 and higher has support for TLS 1.2
				$ch = curl_init($url);
				curl_setopt($ch, CURLOPT_SSLVERSION, 6);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
				curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 15);
				curl_setopt($ch, CURLOPT_TIMEOUT, 150);
				$response = curl_exec($ch);
				curl_close($ch);
				//decode the json response
				// $json = json_decode($response, true);
				// return $json;
				return $response;
					
	}
	
	public function addMember(Request $request)
	{
		$member = new AddMember;
		$member->firstname = $request->firstname;
		$member->lastname = $request->lastname;
		$member->email = $request->email;
		$member->teams_id = $request->teams_id;
		$member->save();
        return response()->json(['success' => $member], $this-> successStatus); 
		
	}
	
	
	public function addTeam(Request $request)
	{		
		$groupName = $request->group_name;
		$team = new Team;
		//$group_name = $request->group_name;
		$team->grouptype= $request->grouptype;
		$team->other_main_activity= $request->other_main_activity;
		$team->group_name= $request->group_name;
		$team->main_activity= $request->main_activity;
		$team->email=  $request->contact_email;
        $team->website_fb_page = $request->facebook_page;
		$team->address= $request->address;
		$team->member_participants= $request->member_participants;
		$team->first_name = $request->first_name;
        $team->last_name = $request->last_name;
        $team->phone = $request->phone;
        $team->mailing_address = $request->mailing_address;
		//$team->other_members = $request->name;
		$other_members=$request->name;
		$e = array();
		foreach($other_members as $members) {
						array_push($e, $members);                  
			}
	   $team->team_members = json_encode($e);	
       // $team->contact_email = $request->contact_email;
		
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
		
		/***************************************************
			End Code Add's _1 to a mail_add_groupname_inc or increment the ending number to allow _2, _3, etc
		***************************************************/
		
		$team->save();
				return response()->json(['success' => $team], $this-> successStatus); 
		
	}
	
	public function SponsorPackageOption(Request $request)
	{
		      $spo = SponsorPackageOption::get();
		      $spo_count = SponsorPackageOption::get()->count();
			  $sp_amount=0;
			  $slot_availables=0;
			  $total_spo_amount=0;
			  foreach($spo as $spos)
			  {
				  $sp_amount +=$spos->sponsor_amount;
				  $slot_availables +=$spos->slot_available;
				  $total_spo_amount +=$spos->Total;
				  
			  }
			 			  
			  return response()->json(['success' => $spo,'sp_amount'=>$sp_amount,'slot_availables'=>$slot_availables,'total_spo_amount'=>$total_spo_amount,'spo_count'=>$spo_count], $this-> successStatus);
	}
	
	public function editPackage(Request $request,$id)
	{
		//echo $id;
        $spo = SponsorPackageOption::find($id);
		//print_r($spo);die();
	    return response()->json(['success' => $spo], $this-> successStatus);		
	}
	public function updatePackage(Request $request,$id)
	{
		
		$requested_data=$request->all();
		//echo $requested_data['active'];die();
        $spo = SponsorPackageOption::find($id);
		$active=$spo->active;
		$description=$spo->description;
		$sp_amount=$spo->sponsor_amount;
		$slot_available=$spo->slot_available;
		$total=$sp_amount*$slot_available;
		
	    $data=[
		'active'=>$requested_data['active']?$requested_data['active']:$active,
		'description'=>$requested_data['description']?$requested_data['description']:$description,
		//'sponsor_amount'=>$requested_data['sponsor_amount']?$requested_data['sponsor_amount']:$sp_amount,
		'slot_available'=>$requested_data['slot_available']?$requested_data['slot_available']:$slot_available,
		//'Total'=>$requested_data['slot_available']?$requested_data['sponsor_amount']?$requested_data['slot_available']*$requested_data['sponsor_amount']:$requested_data['slot_available']*$sp_amount:$total,
		'Total'=>$requested_data['slot_available']*$sp_amount,
		];
	    $update = SponsorPackageOption::where(['id'=>$id])->update($data);
		
	//	$data=['active'=>$active,'description'=>$description,'sponsor_amount'=>$sp_amount,'slot_available'=>$slot_available,'Total'=>$total];
       // $spo->update(['active'=>$active,'description'=>$description,'sp_amount'=>$sp_amount,'slot_available'=>$slot_available,'total'=>$total];
        // );
	   return response()->json(['success' => $data], $this-> successStatus);	
		
       //$spo->update($request->all());
	   //return response()->json(['success' => $spo], $this-> successStatus);		
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
        // print_r($all_content);
        return $all_content;

    }
	
	
   public function crawalWebsiteData($businessName, $city)
   {			
		
	   			$key = new RSA();
				$key->loadKey(file_get_contents('/var/www/app.prepsponsor.com/presponsor2.ppk'));
				//Remote server's ip address or hostname
				$ssh = new SSH2('3.84.12.222');

				if (!$ssh->login('ubuntu', $key)) {
					exit('Login Failed');
				}
				
				else
				{
					//$command = 'cd ../../var/www/app.prepsponsor.com && ls';
					
					// $command = 'cd ../../var/www/app.prepsponsor.com/python_new && python3 app.py --name="the grilled cheese truck" --city="rapid city"';
					
				   $command = 'cd ../../var/www/app.prepsponsor.com/python_new && python3 app.py --name='.sprintf('"%s"', $businessName).' --city='.sprintf('"%s"', $city);
				   $output =$ssh->exec($command);
				   
				    print_r($output);
				  
				} 
   }
		

     function return_response($response){
        return Response::json($response)->header('Content-Type', 'application/json')->header('Access-Control-Allow-Origin','*')->header("Access-Control-Allow-Methods","GET, POST, PUT, DELETE, OPTIONS");
    } 
	
	
	/***********************************
		store txt file data to DB
	***************************************/
	public function storeTxtData($fname){
		$content = File::get('python_new/results/results_'.$fname.'.json');
		$array_data = array();
		$explodestr = explode('{',$content);
		if(!empty($explodestr))
		{
			foreach($explodestr as $expl)
			{
				if(strpos($expl, 'name') !== false) 
				{
					$data = strstr($expl, '}', true);
					$explodeData = explode(",",$data);
					foreach ($explodeData as $key => $value)
					{
						$full_add ="";
						if(strpos($value, 'address') !== false) {
								 $explode_str = explode(':',$value);
								// print_r($explode_str);exit;
								$address = preg_replace("/[']/", ' ', $explode_str[1]); // Removes special chars.
								$FileName = preg_replace('/[^\w]/', '', $address);
						 }
						$email_add="";
						$trim_email='';
						 if(strpos($value, 'email') !== false) 
						{
						   $explode_str = explode(':',$value);
						   $email_add = preg_replace("/[']/", '', @$explode_str[1]); // Removes special chars.
						   $repl_email = preg_replace('/[^\w]/', '', $email_add);
						   $trim_email=trim($repl_email);

						}
						$trim_bname='';
						 if(strpos($value, 'name') !== false) 
						 {
							$explode_str = explode(':',$value);
							$business_name = preg_replace('/["]/', '', @$explode_str[1]); // Removes special chars.
							$repl_bname =preg_replace('/[^\w]/', '', $business_name);
                            $trim_bname=trim($repl_bname);
						 }
              $ifBname = Yelp_address::Where('email',$trim_email)
                                       ->where('business_name',$trim_bname)
                                       ->where('email','<>','')
                                       ->where('business_name','<>','')->count();
						if($ifBname<=0)
						{
							$yelp_address= new Yelp_address();
							    $yelp_address->email = $email_add;
								$yelp_address->business_name = $business_name;
								$yelp_address->address = $full_add;
								$yelp_address->location = $fname;
								$yelp_address->save();
						}
					
				    }
			    }
		    }
		    $data = Yelp_address::where('location',  $fname)->get();
		    return $data;
	    }
	else{
			return response()->json([
				'success' => false,
				'message' => 'No Data found.'
			], 422);
		}
	}
}