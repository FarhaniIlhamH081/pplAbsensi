@extends('layouts.admin')
@section('title', 'Absensi SMPIT GENERASI RABBANI')
@section('nama', 'Daftar Kelas')
@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    @if(session()->exists('notif'))
    @if(session()->get('notif')['success'])
    {!! 
    '<div class="alert alert-success alert-dismissable"> 
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>Sukses! </strong>'. session()->get('notif')['msgaction'] .'
    </div>' 
    !!}
    @else
    {!! 
    '<div class="alert alert-danger alert-dismissable"> 
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>Gagal! </strong>'. session()->get('notif')['msgaction'] .'
    </div>' 
    !!}
    @endif
    @endif
    <div class="table-responsive">
        <div class="table-responsive">
            <table id="absensi" class="table table-bordred table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th width="3%" class="text-center">No</th>
                        <th width="60%">Nama Kelas</th>
                        <th width="5%" class="text-center">Kuota</th>
                        <th width="10%" class="text-center">Tahun Ajaran</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($resource as $index => $res)
                    <tr>
                        <td class="text-center">{{ $index+1 }}</td>
                        @if($res->nama_kelas > 1)
                        <td><a href="{{url('/absensi/'.$res->id_kelas)}}">{{ $res->tingkat_kelas.'-'.$res->jurusan." ".$res->nama_kelas }}</a></td>
                        @else
                        <td><a href="{{url('/absensi/'.$res->id_kelas)}}">{{ $res->tingkat_kelas.'-'.$res->jurusan}}</a></td>
                        @endif
                        <td class="text-center">{{$res->kuota}}</td>
                        <td class="text-center">{{$res->tahun_masuk."/".$res->tahun_keluar}}</td>
                    </tr>
                    @endforeach
                </tbody>
              </table>
        </div>
        <ul class="pagination pull-right">
            {!! $resource->render() !!}
        </ul>
    </div>
</div>
@endsection