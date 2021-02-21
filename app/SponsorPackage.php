<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SponsorPackage extends Model
{   
	
    protected $table = 'sponsor_package';
    public $timestamps = false;
    protected $fillable = [
        'participants', 'diamond', 'platinum', 'gold', 'silver'
    ];

}
