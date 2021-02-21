<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Stripe, Mailgun, SparkPost and others. This file provides a sane
    | default location for this type of information, allowing packages
    | to have a conventional place to find your various credentials.
    |
    */

    'mailgun' => [
        'domain' => 'mail.prepsponsor.com',
        'secret' => 'key-4jivaqojc4vf52agjv78qjd189rvi6w5',
        'endpoint' => 'https://api.mailgun.net/v3/mail.prepsponsor.com',
    ],

    'postmark' => [
        'token' => env('POSTMARK_TOKEN'),
    ],

    // 'ses' => [
        // 'key' => env('AWS_ACCESS_KEY_ID'),
        // 'secret' => env('AWS_SECRET_ACCESS_KEY'),
        // 'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    // ],
	
	 'ses' => [
        'key' => "AKIAVDVH4AK6YDM2HIOW",
        'secret' => "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",
         'region' =>'us-east-1',
    ],

    'sparkpost' => [
        'secret' => env('SPARKPOST_SECRET'),
    ],
    'stripe' => [
        'model' => 'App\Models\User',
        'key' => env('STRIPE_KEY'),
        'secret' => env('STRIPE_SECRET'),
    ],
    // 'stripe' => [
    //     'model' => App\User::class,
    //     'key' => "************",
    //     'secret' => "***********",
      
    //     'webhook' => [
    //         'secret' => env('STRIPE_WEBHOOK_SECRET'),
    //         'tolerance' => env('STRIPE_WEBHOOK_TOLERANCE', 300),
    //     ],
    // ],

];
