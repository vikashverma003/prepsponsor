<?php
namespace App\Http\Controllers;
ini_set('max_execution_time', 300); //300 seconds = 5 minutes
use App\Modelname;
use Illuminate\Http\Request;
use Goutte\Client;
use Symfony\Component\DomCrawler\Crawler;
use App\Crawl;
use App\Yelp_address;
use App\yelp_url;
use App\yelp_test;
use App\Mail\sponsor_email;
use Mail;
use App\Team;
use Illuminate\Support\Str;


class ModelnameController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
	 public function __construct()
    {
        $this->middleware('auth:admin');
    }

      public function sendMail2(Request $request)
    {
       /*Important one*/

       $url = yelp_url::find(1);

       $key = $url->key;
       $sponser_email="sdf@gmail.com";
       $business_name="dfgdf";
       $data=['email'=>$sponser_email, 'business_name'=>$business_name];

       Mail::to('vikashverma003@gmail.com')->send(new sponsor_email($data));
            // Mail::send(new SendEmail());
    }

    public function domainName(Request $request)
    {
        $data = array(
               //"remoteAddress"=>"https://www.cafecentral.wien/en/"
                "remoteAddress"=>"https://www.woodysbbq.com"
           //"remoteAddress"=>"https://www.tripadvisor.in/Restaurant_Review-g190454-d711471-Reviews-Figlmuller-Vienna.html"
        );
          //$request_url = "socwall.com";
            $ch = curl_init("https://www.yougetsignal.com/tools/whois-lookup/php/get-whois-lookup-json-data.php");
            // curl_setopt($ch, CURLOPT_HTTPHEADER,
            //     array(
            //         "Content-Type: application/json",
            //         "Authorization: Bearer ".$api_key
            // ));
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            $response = curl_exec($ch); // Yelp response
            $arrayOfResults = json_decode($response, true);
             dd($arrayOfResults);
            $str = $arrayOfResults['whoisData'];
            $string =   $str;
            $subString = strstr($string, 'Email', true);
           

    }
	/** for testing the WHOIS DATA **/
	public function key_data($web_address){	
	//echo 232;die();
			$apiUrl = 'https://www.whoisxmlapi.com/whoisserver/WhoisService';
			$apiKey = 'at_fWH8r28hfXRqR6VowrePqWThwHfb8';
			//$domainName = 'whoisxmlapi.com';
			//$domainName = 'https://www.threesquarescafe.com/';
			 $domainName = $web_address;
			$params = array(
				'apiKey' => $apiKey,
				'domainName' => $domainName,
				'outputFormat' => 'JSON'
			);

			$url = $apiUrl . '?' . http_build_query($params, '', '&');
			//print($url . PHP_EOL . PHP_EOL);
			$response = file_get_contents($url);
			$res = json_decode($response);
			if (! $res)
				return;
			if (! empty($res->ErrorMessage)) {
				print($res->ErrorMessage->msg . PHP_EOL);
				return;
			}
			$whoisRecord = $res->WhoisRecord;
			if (! $whoisRecord)
				return;
			//echo "<pre>";
			//print_r($whoisRecord);
			//$data= response()->json(['createdDate' =>$whoisRecord->createdDate,'updatedDate'=>$whoisRecord->updatedDate,'email'=>$whoisRecord->registrant->email]);
			$data=json_encode(array('createdDate' =>$whoisRecord->createdDate,'updatedDate'=>$whoisRecord->updatedDate,'email'=>$whoisRecord->registrant->email,'whois_zerobounce_test'=>NULL));
			return $data;
			//return $whoisRecord;
	}
	
	public function whois_list(Request $request){
		$teams = Team::orderBy('id', 'desc')->paginate(15);
    		$data = array(
    			'title'=>'Teams',
    			'teams'=>$teams
    		);
	     	return view('teams.whois_list')->with('data',$data);
	}
	public function collect_whois_data($id){
		$teamsEmail  = Team::where('id', '=', $id)->first();
		$teams_zipcode =  $teamsEmail->address;		
		$all_zipcodes= $teams_zipcode +10;
		$k=array();
		$t=array();
		while($teams_zipcode<$all_zipcodes)
		 {
			array_push($k, $teams_zipcode);	
			$teams_zipcode++;
		  }   
		$sponsorsEmail  = Yelp_address::whereIn('location',$k)->get();
		foreach($sponsorsEmail as $sponsorsEmails){
			$web_address=$sponsorsEmails->web_address;
			$id=$sponsorsEmails->id;
			if(!empty($web_address)){
				$check=$this->key_data($web_address);
				$check_valid=json_decode($check);
				$d=$check_valid->email;
				//$preg_match=preg_match("@gmail.com", $d->email);
				$check1=$this->zerobounce_test($d);
				$json = json_decode($check1);
				// array_push($k, $json);
				//echo $json->status;die();
				if($json->status=='valid'){
					$email_address=$json->address;
					//array_push($t, $json->status);
				   $check_status  = Yelp_address::where('id','=',$id)->where('web_address','=',$web_address)->update(['whois_data'=>$email_address]);
				}
				else{
					//array_push($t, $json->status);
				  $check_status  = Yelp_address::where('id','=',$id)->where('web_address','=',$web_address)->update(['whois_data'=>0]);
				}
				// echo "<pre>";
				// print_r($check_valid->email);die();
				// if(!empty($check))
				// {
				// $check_status  = Yelp_address::where('id','=',$id)->where('web_address','=',$web_address)->update(['whois_data'=>$check]);
				// }
			}
		}
		return redirect('admin/whois_list');
	}
	
	
	/** for implementing the zerbounce email. For validating the proper email or valid email. **/
	
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
	
	public function zerobounce_check(Request $request){
		
		$teams = Team::orderBy('id', 'desc')->paginate(15);
    		$data = array(
    			'title'=>'Teams',
    			'teams'=>$teams
    		);
	     	return view('teams.zerobounce_test')->with('data',$data);
	}
	
	public function zerobounce_validation(Request $request, $id){
		$teamsEmail  = Team::where('id', '=', $id)->first();
		$teams_zipcode =  $teamsEmail->address;		
		$all_zipcodes= $teams_zipcode +10;
		$k=array();
		while($teams_zipcode<$all_zipcodes)
		 {
			array_push($k, $teams_zipcode);	
			$teams_zipcode++;
		  }   
		$sponsorsEmail  = Yelp_address::whereIn('location',$k)->get();
		$sponsorsEmail_count  = Yelp_address::whereIn('location',$k)->get()->count();
		if($sponsorsEmail_count>=1)
		{
		foreach($sponsorsEmail as $sponsorsEmails){
			$email=$sponsorsEmails->email;
			$id=$sponsorsEmails->id;
			/*$whois_check_email= json_decode($sponsorsEmails['whois_data'],true);
			if($whois_check_email !=NULL)
			 {
			     $email_whois=$whois_check_email['email'];
				 $check=$this->zerobounce_test($email_whois);
				 $json = json_decode($check);
			 
					if($json->status=='valid'){
						$check_status  = Yelp_address::where('id','=',$id)->update(['whois_data->whois_zerobounce_test'=>1]);
					}
					else
					{
						$check_status  = Yelp_address::where('id','=',$id)->update(['whois_data->whois_zerobounce_test'=>0]);
					}			 
			 }*/
			if(!empty($email)){
				$check=$this->zerobounce_test($email);
				$json = json_decode($check);
				//echo $json->status;die();
				if($json->status=='valid'){
					$check_status  = Yelp_address::where('id','=',$id)->where('email','=',$email)->update(['zerobounce_test'=>1]);
				}
				else
				{
					$check_status  = Yelp_address::where('id','=',$id)->where('email','=',$email)->update(['zerobounce_test'=>0]);

				}
			}
		}
		 return redirect('admin/zerobounce_check')->with('su_status', 'Validation has been successfull.');;

		}
		else
		{
		return redirect('admin/zerobounce_check')->with('er_status', 'No sponsors found');;
		}
	}
	
    public function fetch_yelp($location)
    {
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

public function fetch_count(Request $request, $location)
{
    $l = $location;
    $count=0;
    $member = 400;   
    if($member<500)
    {
          $array_content = array();

        while($count<=40)
        {
          array_push($array_content,  $l);
           $yelp_address = yelp_test::where('location',  $l)->get();
           $yelp_address_count = yelp_test::where('location',  $l)->count();

           if($yelp_address_count>0)
           {
            //array_push($array_content,  $l);
            while($count<40)
            {

            // echo "fetch the content";
             $yelp_address = yelp_test::where('location',  $l)->get();
             $yelp_address_count = yelp_test::where('location',  $l)->count();

             $count +=$yelp_address_count;
              //$count++;
             array_push($array_content,  $l);

             $l++;
            }
           
            $sponser = yelp_test::whereIn('location', $array_content)->get();
            return view('admin.sponsors.mailing')->with('data', $sponser);

           }
           else
           {

          $loop_data = $this->fetch_yelp($l);
          // testing
           foreach($loop_data as $city)
                {
                         $yelp_address = new yelp_test;
                         $business_name = $city->name;
                         $phone = $city->phone;
                        // echo $city->alias;
                         $city1 = $city->location->city;
                         $address = $city->location->address1;
                        // $zipcode = $city->location->zip_code->count();
                         $lat= $city->coordinates->latitude;
                         $lng= $city->coordinates->longitude;
                         $yelp_address->location = $l;
                         $yelp_address->city = $city1 ;
                         $yelp_address->business_name =$business_name;
                         $yelp_address->latitude =$lat;
                         $yelp_address->longitude =$lng;
                         $yelp_address->phone = $phone ;
                         $yelp_address->address = $address ;
                         $yelp_address->save();
                }    
                $second_count = count($loop_data);
                $count += $second_count ;
                $l++;
                $count++;
        }
    }
        $sponser = yelp_test::whereIn('location', $array_content)->get();
        return view('admin.sponsors.mailing')->with('data', $sponser);
      }
      else
      {    
          $array_content = array();
          while($count<=70)
            {
             
              array_push($array_content,  $l);
              $loop_data = $this->fetch_yelp($l);
              // testing
              $second_count = count($loop_data);
              $count += $second_count ;
              if($count<=70)
              {
                 foreach($loop_data as $city)
                      {
                               $yelp_address = new yelp_test;
                               $business_name = $city->name;
                               $phone = $city->phone;
                                 $address = $city->location->address1;
                              // echo $city->alias;
                               $city1 = $city->location->city;
                              // $zipcode = $city->location->zip_code->count();
                               $lat= $city->coordinates->latitude;
                               $lng= $city->coordinates->longitude;
                               $yelp_address->location = $l;
                               $yelp_address->city = $city1 ;
                               $yelp_address->business_name =$business_name;
                               $yelp_address->latitude =$lat;
                               $yelp_address->longitude =$lng;
                               $yelp_address->phone = $phone ;
                               $yelp_address->address = $address ;
                               $yelp_address->save();
                      } 
                  }   
                  
                    $l++;
                    $count++;
            }
             $sponser = yelp_test::whereIn('location', $array_content)->get();
             return view('admin.sponsors.mailing')->with('data', $sponser);
      }

}

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Modelname  $modelname
     * @return \Illuminate\Http\Response
     */
    public function show(Modelname $modelname)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Modelname  $modelname
     * @return \Illuminate\Http\Response
     */
    public function edit(Modelname $modelname)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Modelname  $modelname
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Modelname $modelname)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Modelname  $modelname
     * @return \Illuminate\Http\Response
     */
    public function destroy(Modelname $modelname)
    {
        //
    }
}
