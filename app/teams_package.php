<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class teams_package extends Model
{
    //

     protected $table = 'teams_package';
    public $timestamps = false;
    protected $fillable = [
        'tier_name', 'active', 'description', 'sponsor_amount', 'slot_available', 'teams_id', 'Total'
    ];
}
