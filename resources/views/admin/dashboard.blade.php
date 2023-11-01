@extends('layouts.admin')
@section('title', 'Absensi SMPIT GENERASI RABBANI')
@section('content')
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

        <!--/.row-->

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="card ml-3" style="width: 300px">
                        <div class="card-body" >
                          <h5 class="card-title">Special title treatment</h5>
                          <p>Selamat Datang {{ Auth::user()->username }} !</p>
                          <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                      </div>
                            
                    @if (!isQrCodeExist())
                        <form action={{ route('qrcode.store') }} method="POST">
                            @csrf
                            <button class="btn btn-primary">Generate QR Code</button>
                        </form>
                    @else
                        <div class="ml-3">
                                {!! QrCode::size(200)->generate(getTodayQrCode()) !!}
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
    <!--/.row-->
    <!--/.main-->
@endsection
