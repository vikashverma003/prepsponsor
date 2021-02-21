<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;

class MailgunWidgetsController extends Controller
{
    //
    public function store(Request $request)
    {
        app('log')->debug(request()->all());
		 // $files = collect(json_decode($request->input('attachments'), true))
        // ->filter(function ($file) {
            // return $file['content-type'] == 'text/csv';
        // });

		// if ($files->count() === 0) {
			// return response()->json([
				// 'status' => 'error',
				// 'message' => 'Missing expected CSV attachment'
			// ], 406);
		// }

      // dispatch(new ProcessWidgetFiles($files));
	  

        return response()->json(['status' => 'ok']);
    }


}
