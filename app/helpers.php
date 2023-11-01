<?php

use App\Absensi;
use App\Qrcode;
use Carbon\Carbon;

if (!function_exists('getIndonesianTimeToday')) {
    function getIndonesianTimeToday()
    {
        $indonesian_timezone = new DateTimeZone("Asia/Jakarta");
        $today = Carbon::now($indonesian_timezone)->toDateString();

        return $today;
    }
}

if (!function_exists('isQrCodeExist')) {
    function isQrCodeExist()
    {
        $latest_qr_code = Qrcode::latest()->first();
        $today = getIndonesianTimeToday();

        if (isset($latest_qr_code)) {
            if ($latest_qr_code->tanggal === $today) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
        // return $latest_qr_code?->tanggal === $today;
    }
}

if (!function_exists('getTodayQrCode')) {
    function getTodayQrCode()
    {
        $latest_qr_code = Qrcode::latest()->first();

        return $latest_qr_code->code;
    }
}

if (!function_exists('siswaAlreadyAbsentToday')) {
    function siswaAlreadyAbsentToday($siswa_id, $kelas_id)
    {
        $absent_count = Absensi::where([
            'siswa_id' => $siswa_id,
            'kelas_id' => $kelas_id,
            'tanggal' => getIndonesianTimeToday(),
            'status' => "Hadir"
        ])->count();

        return $absent_count;
    }
}
