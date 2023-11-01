@extends('layouts.siswa')
@section('title', 'AN Absensi | Dashboard')
@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">Dashboard</li>
        </ol>
    </div>
    <!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            @if (Session::has('success'))
            <div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert">
                    <i class="fa fa-times"></i>
                </button>
                <strong>Success !</strong> {{ session('success') }}
            </div>
            @endif
            @if (Session::has('error'))
            <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert">
                    <i class="fa fa-times"></i>
                </button>
                <strong>Error !</strong> {{ session('error') }}
            </div>
            @endif
            <div class="panel panel-default">
                <div class="panel-heading">Dashboard</div>
                <div class="panel-body">
                    <blockquote>
                        <p>Selamat Datang @if(Auth::user()->akses=="Siswa") Siswa  @endif {{$resource->nama}} !
                        </p>
                    </blockquote>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">Profil</div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="profil" class="table table-striped">

                            <tr>
                                <td>Nama Siswa</td>
                                <td>{{$resource->nama}}</td>
                            </tr>

                            <tr>
                                <td>Jenis Kelamin</td>
                                <td>@if($resource->jenis_kelamin=="L")Laki-Laki @else Perempuan @endif</td>
                            </tr>
                            <tr>
                                <td>Kelas</td>
                                <td>
                                    {{$resource->tingkat_kelas}}
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>
                @if(Auth::user()->akses=="Siswa")
                <div class="panel-footer">
                    <td colspan="2"><button class="edit-button btn btn-default" data-aksi="siswa"
                            data-nama="{{$resource->nama}}" data-id="{{$resource->id_siswa}}"
                            data-jk="{{$resource->jenis_kelamin}}" data-nis="{{$resource->nis}}" data-toggle="modal"
                            data-target="#edit">Edit Data</button></td>
                </div>
                @endif

                @if (!siswaAlreadyAbsentToday($resource->id_siswa, $kelas_id))
                <div id="reader" width="600px"></div>
                <form class="form-inline" action="{{ route('submit_absen') }}" method="post">
                    @csrf
                    <div class="form-group">
                        <input class="form-control" type="text" name="qr_code" id="qr_code">
                    </div>
                    <input type="hidden" name="siswa_id" value="{{ $resource->id_siswa }}">
                    <input type="hidden" name="kelas_id" value="{{ $kelas_id }}">
                    <input type="hidden" name="status" value="Hadir">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
                @else
                <div class="alert alert-success" role="alert">
                    Anda sudah absen hari ini.
                </div>
                @endif
            </div>
        </div>
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">Kehadiran</div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            {{-- <tr>
                                <td>Alfa : {{$absen[3]['alfa']}}</td>
                            </tr>
                            <tr>
                                <td>Izin : {{$absen[3]['izin']}}</td>
                            </tr>
                            <tr>
                                <td>Sakit : {{$absen[3]['sakit']}}</td>
                            </tr> --}}
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/.row-->
    <div class="col-sm-12">
        <p class="back-link">&copy;
            <?php echo date('Y') ?> Amrul
        </p>
    </div>
</div>
<!--/.row-->
<!--/.main-->
<div id="edit" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="title-modal">Ubah Data</h4>
            </div>
            <form action="/siswa/" method="post">
                <input type="hidden" name="id_siswa" id="id">
                <input type="hidden" name="nis" value="{{$resource->nis}}">
                <input type="hidden" name="tingkat_kelas" value="{{$resource->tingkat_kelas}}">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="nis">NIS</label>
                                <input class="form-control" type="text" id="nis" name="nis"
                                    placeholder="Nomor Induk Siswa" disabled>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="siswa">Nama Siswa</label>
                                <input class="form-control" type="text" id="nama_siswa" name="nama"
                                    placeholder="Nama Siswa">
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="jk">Jenis Kelamin</label>
                                <select class="form-control" id="jk" name="jk">
                                    <option selected disabled>--Pilih Jenis Kelamin--</option>
                                    <option value="L">Laki - Laki</option>
                                    <option value="P">Perempuan</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                {{ csrf_field() }}
                {{ method_field('PUT') }}
                <div class="modal-footer ">
                    <button type="submit" class="btn btn-info btn-lg" style="width: 100%;"><span
                            class="glyphicon glyphicon-edit"></span> Update Data</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
@section('js')
<script src="https://unpkg.com/html5-qrcode" type="text/javascript"></script>
<script>
    function onScanSuccess(decodedText, decodedResult) {
        // handle the scanned code as you like, for example:
        // console.log(`Code matched = ${decodedText}`, decodedResult);
        $("#qr_code").val(decodedText);
    }
    
    function onScanFailure(error) {
        // handle scan failure, usually better to ignore and keep scanning.
        // for example:
        console.warn(`Code scan error = ${error}`);
    }
    
    let html5QrcodeScanner = new Html5QrcodeScanner(
    "reader",
    { fps: 10, qrbox: {width: 250, height: 250} },
    /* verbose= */ false);
    html5QrcodeScanner.render(onScanSuccess, onScanFailure);
</script>
<script>
    $(".edit-button").click(function(){
        if($(this).data('aksi')=="siswa"){
            $('#id').val($(this).data('id'));
            $('#nama_siswa').val($(this).data('nama'));
            $('#nis').val($(this).data('nis'));
            $('#jk').val($(this).data('jk'));
        }
    });
</script>
@endsection