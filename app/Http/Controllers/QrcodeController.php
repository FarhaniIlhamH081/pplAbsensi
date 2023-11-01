<?php

namespace App\Http\Controllers;

use App\Qrcode;
use Carbon\Carbon;
use DateTimeZone;

class QrcodeController extends Controller
{
    public function store()
    {
        Qrcode::create([
            "code" => uniqid(),
            "tanggal" => Carbon::now(new DateTimeZone("Asia/Jakarta"))->toDateString(),
        ]);
        return redirect('/');
    }
}
