<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\SponsorPackage;
use App\SponsorPackageOption;
use App\Team;

class PackageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
	 // public function __construct()
    // {
        // $this->middleware('auth:admin');
    // }
    public function index()
    {
        
        $package=SponsorPackage::get();
        return view('admin.package.index')->with('package', $package);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.package.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $package=new SponsorPackage;
        $package->participants= $request->participants;
        $package->diamond= $request->diamond;
        $package->platinum= $request->platinum;
        $package->gold= $request->gold;
        $package->silver= $request->silver;
        $package->save();
         return redirect('admin/package/')->with('success', 'package has been created successfully');

    }


    public function selectPackage(Request $request, $id,$sponsor_id)
    {
        $team_id = $id;
		$sponsor_id=$sponsor_id;
        $package=SponsorPackageOption::get();
        
       return view('selectPackage', ['package'=>$package, 'id'=>$team_id, 'sponsor_id'=>$sponsor_id]);

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
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

     $package=SponsorPackage::find($id);

     return view('admin.package.edit')->with('package', $package);

        
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
        
        $package=SponsorPackage::find($id);
        $package->participants= $request->participants;
        $package->diamond= $request->diamond;
        $package->platinum= $request->platinum;
        $package->gold= $request->gold;
        $package->silver= $request->silver;
        $package->save();
       return redirect('admin/package/')->with('success', 'package has been created successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $sponsor = SponsorPackage::find($id);
        $sponsor->delete();
        return redirect('admin/package/')->with('success', 'Deletion has been done successfully');

    }
	
	public function thank_you_page(Request $request, $id)
	{
		$team = Team::where('id', '=', $id)->first();
		// echo "<pre>";
		// print_r($team);
		// die();
		return view('thank_you')->with('team', $team);
			
	}
	
	
	public function teams_package(Request $request)
	{
		//echo 1242;
		  $package=SponsorPackageOption::get();
			
		  return view('admin.package.package_index')->with('package', $package);
		
	}
	
	public function teams_package_edit(Request $request, $id)
	{
		$package_edit=SponsorPackageOption::find($id);
		return view('admin.package.teams_package_edit')->with('package_edit',$package_edit);	
	}
	
	
	public function teams_package_update(Request $request,$id)
	{
		
		$package_update=SponsorPackageOption::find($id);
		$spo_amount=$request->sponsor_amount;
		$slot_available=$request->slot_available;
		
		$package_update->tier_name=$request->tier_name;
		$package_update->active=$request->active;
		$package_update->description=$request->description;
		$package_update->sponsor_amount=$request->sponsor_amount;
		$package_update->slot_available=$request->slot_available;
		$package_update->Total=$spo_amount*$slot_available;
		$package_update->save();
		
		return redirect('/admin/teams_package/');
		
	}
	
	
	
}
