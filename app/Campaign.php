<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Campaign extends Model
{
    //
	
			 protected $fillable = ['teams_id', 'teams_custom_email', 'sponsors_custom_email', 'teams_real_email','sponsors_real_email', 'text'];
}
