<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class sponsor_payment extends Model
{
    

	protected $table = 'sponsor_payment';

	 public $timestamps = false;

      protected $fillable = ['card_last_four','card_id', 'card_brand', 'stripe_customer','balance_transaction','stripe_id', 'card_number', 'cvv', 'expiry_month', 'expiry_year', 'amount', 'email', 'business_name', 'team_id'];

}
