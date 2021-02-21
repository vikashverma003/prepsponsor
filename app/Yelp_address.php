<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Yelp_address extends Model
{
    //
    protected $table = 'yelp_address';

	// public $timestamps = false;

      protected $fillable = ['location', 'city', 'business_name', 'latitude', 'longitude', 'phone', 'address', 'email'];


}
