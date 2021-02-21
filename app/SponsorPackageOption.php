<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SponsorPackageOption extends Model
{
   

    protected $table = 'sponsor_package_option';
    public $timestamps = false;
    protected $fillable = [
        'sponsorpackage_id', 'tier_name', 'active', 'description', 'sponsor_amount', 'slot_available', 'teams_id', 'Total'
    ];

}
