@extends('layouts.admin')
@section('title', 'Absensi SMPIT GENERASI RABBANI')
@section('nama', 'Dashboard')
@section('content')

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>150</h3>
                            <p>Kelas</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-bag"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-success">
                        <div class="inner">
                            <h3>53<sup style="font-size: 20px">%</sup></h3>
                            <p>Siswa</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-stats-bars"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-warning">
                        <div class="inner">
                            <h3>44</h3>
                            <p>Akun</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-person-add"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-danger">
                        <div class="inner">
                            <h3>65</h3>
                            <p>Guru</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-pie-graph"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="row">
                <section class="col-lg-7 connectedSortable">
                    <div class="panel panel-default">
                        <div class="card ml-3 text-center" style="width: 400px">
                            <div class="card-body">
                                <center>
                                    <h5 class=" mb-4">Selamat Datang {{ Auth::user()->username }} !</h5>
                                </center>
                                @if (!isQrCodeExist())
                                    <form action={{ route('qrcode.store') }} method="POST">
                                        @csrf
                                        <button class="btn btn-primary">Generate QR Code</button>
                                    </form>
                            </div>
                        </div>
                    @else
                        <div class="ml-3">
                            {!! QrCode::size(200)->generate(getTodayQrCode()) !!}
                        </div>
                        @endif
                    </div>
                </section>
                <section class="col-lg-5 connectedSortable">
                    as
                </section>
            </div>
        </div>
    </section>
{{-- 
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="card ml-3 text-center" style="width: 400px">
                        <div class="card-body">
                            <center>
                                <h5 class=" mb-4">Selamat Datang {{ Auth::user()->username }} !</h5>
                            </center>
                            @if (!isQrCodeExist())
                                <form action={{ route('qrcode.store') }} method="POST">
                                    @csrf
                                    <button class="btn btn-primary">Generate QR Code</button>
                                </form>
                        </div>
                    </div>
                @else
                    <div class="ml-3">
                        {!! QrCode::size(200)->generate(getTodayQrCode()) !!}
                    </div>
                    @endif
                </div>
            </div>
        </div>
    </div> --}}
    <!--/.row-->
    <!--/.main-->
@endsection
