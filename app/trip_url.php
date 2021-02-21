<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class trip_url extends Model
{
    
protected $table = 'trip_url';

	 public $timestamps = false;
      protected $fillable = ['business_name', 'url'];

}
