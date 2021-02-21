<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AddMember extends Model
{
    public $timestamps = false;

    protected $fillable = [
        'firstname', 'lastname', 'email', 'teams_id'
    ];
    
}
