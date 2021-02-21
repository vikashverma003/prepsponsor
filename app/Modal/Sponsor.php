<?php

namespace App\Modal;

use Illuminate\Database\Eloquent\Model;

class Sponsor extends Model
{
    // protected $fillable = ['grouptype', 'phone', 'email', 'main_activity', 'first_name', 'last_name', 'member_participants', 'mail_add_groupname', 'title', 'website_fb_page'];
    protected $fillable = ['sponsor_name', 'category', 'yelp_website', 'yelp_address', 'trip_advisor_email', 'yellow_pages_email', 'website_email', 'whoIs_email', 'manually_email', 'team_id',  'unsubscribe_date', 'sponsorship_tier',  'sponsorship_amount', 'sponsorship_date', 'lat', 'lng'];
}
