<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Qrcode extends Model
{
    use HasFactory;

    protected $table = 'qr_code';
    protected $primaryKey = 'code';
    protected $keyType = "string";
    protected $fillable = ['code', 'tanggal'];
}
