<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class NormalizeResult extends Controller
{
    public static function index($data, int $statusCode = 200){
        $response = [
            'server_host' => request()->getHttpHost(),
            'datetime'    => Carbon::now(),
            'status'      => 'success',
            'data'        => $data,
            'total'       => count($data)
        ];
        
        return response()->json($response, $statusCode);
    }
}
