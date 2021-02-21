<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use phpseclib\Crypt\RSA;
use phpseclib\Net\SSH2;

class ConnectionController extends Controller
{
	   	public function SSH($cmd)
		{
				$key = new RSA();
				$key->loadKey(file_get_contents('/var/www/app.prepsponsor.com/presponsor2.ppk'));
				//Remote server's ip address or hostname
				$ssh = new SSH2('3.84.12.222');
				if (!$ssh->login('ubuntu', $key)) {
					exit('Login Failed');
				}
				else
				{
					return $ssh->exec($cmd);	
				}
		
		}
	
}
