<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
    protected $fillable = ['other_members','team_members', 'grouptype', 'group_name', 'address', 'phone', 'email', 'main_activity', 'first_name', 'last_name', 'member_participants', 'mail_add_groupname', 'title', 'website_fb_page', 'plan_name', 'other_main_activity', 'costumEmail'];
}
