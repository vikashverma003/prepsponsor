<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class yelp_url extends Model
{
    
     protected $table = 'yelp_url';

	 public $timestamps = false;

      protected $fillable = ['key', 'url'];
}
