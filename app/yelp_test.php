<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class yelp_test extends Model
{
    //

    protected $table = 'yelp_test';

	 public $timestamps = false;

      protected $fillable = ['location', 'city', 'business_name', 'latitude', 'longitude', 'phone', 'address'];

}
