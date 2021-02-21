<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Crawl extends Model
{
	    public $timestamps = false;

    
      protected $fillable = ['links', 'phone', 'email'];

}
