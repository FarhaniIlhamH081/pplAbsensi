<?php

namespace App\Http\Controllers;

use App\Absensi;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Siswa;
use App\Qrcode;
use Carbon\Carbon;
use PDF;

class SiswaController extends Controller
{
    public function index()
    {
        $resource = Siswa::paginate(10);
        return view('Admin/siswa', ['resource' => $resource]);
    }
    public function submitAbsen(Request $request)
    {
        /*
        * Validasi absensi
        * 1. Cek QR code hari ini
        * 2. Jika inputan qr_code yang dimasukkan === qr_code hari ini maka siswa berhasil absen,
             jika tidak maka tampilkan error.
        */

        $recent_qr_code = Qrcode::where('tanggal', getIndonesianTimeToday())->first();

        if ($recent_qr_code->tanggal === getIndonesianTimeToday() && $recent_qr_code->code === $request->qr_code) {
            $absen = new Absensi;
            $absen->siswa_id = $request->siswa_id;
            $absen->kelas_id = $request->kelas_id;
            $absen->tanggal = getIndonesianTimeToday();
            $absen->status = $request->status;
            $absen->keterangan = $request->status;
            $absen->save();
            return redirect()->route("user-dashboard")->with("success", "Absen Berhasil Di Input");
        } else {
            return redirect()->route("user-dashboard")->with("error", "QR Code yang anda masukkan salah!");
        }
    }

    public function create(Request $request)
    {
        $check = Siswa::where(['nis' => $request->nis])->get();
        if ($check->count() > 0) {
            session()->flash('notif', array('success' => false, 'msgaction' => 'Tambah Data Gagal, Data Telah Ada!'));
            return redirect('/admin/siswa');
        } else {
            $Siswa = new Siswa;
            $Siswa->nis = $request->nis;
            $Siswa->nama = $request->nama;
            $Siswa->jenis_kelamin = $request->jk;
            $Siswa->tingkat_kelas = $request->tingkat_kelas;
            if ($Siswa->save()) {
                session()->flash('notif', array('success' => true, 'msgaction' => 'Tambah Data Berhasil!'));
            } else {
                session()->flash('notif', array('success' => false, 'msgaction' => 'Tambah Data Gagal, Silahkan Ulangi!'));
            }
            return redirect('/admin/siswa');
        }
    }
    public function update(Request $request)
    {
        $siswa = Siswa::find($request->id_siswa);
        $siswa->nis = $request->nis;
        $siswa->nama = $request->nama;
        $siswa->jenis_kelamin = $request->jk;
        $siswa->tingkat_kelas = $request->tingkat_kelas;
        if ($siswa->save()) {
            session()->flash('notif', array('success' => true, 'msgaction' => 'Edit Data Berhasil!'));
        } else {
            session()->flash('notif', array('success' => false, 'msgaction' => 'Edit Data Gagal, Silahkan Ulangi!'));
        }
        if (Auth::user()->akses == 'admin') {
            return redirect('admin/siswa');
        } else {
            return redirect('/admin/siswa');
        }
    }
    public function delete($id)
    {
        Siswa::find($id)->delete();
        session()->flash('notif', array('success' => true, 'msgaction' => 'Hapus Data Berhasil!'));
        return redirect('/admin/siswa');
    }
    public function show($id)
    {
        $resource = Siswa::find($id);
        return view('siswa/profil', ['resource' => $resource]);
    }
    public function search(Request $request)
    {
        $key = $request->kunci;
        $tingkat = $request->kelas;
        $jk = $request->jk;
        $resource = new Siswa;
        if ($key != "") {
            $resource = $resource->where(function ($like) use ($key) {
                $like->where('nis', 'like', '%' . $key . '%');
                $like->orWhere('nama', 'like', '%' . $key . '%');
            });
        }
        if ($tingkat != "") {
            $resource = $resource->where('tingkat_kelas', $tingkat);
        };
        if ($jk != "") {
            $resource = $resource->where('jenis_kelamin', $jk);
        }
        $resource = $resource->paginate(10);
        if (count($resource) == 0) {
            echo "<td colspan='9' class='text-center'>Tidak ada data</td>";
        }
        $index = 1;
        foreach ($resource as $res) {
?>
            <tr>
                <td><input type="checkbox" class="checkthis" /></td>
                <td class="text-center"><?php echo $index ?></td>
                <td><?php echo $res->nis ?></td>
                <td><?php echo $res->nama ?></td>
                <td class="text-center"><?php echo $res->tingkat_kelas ?></td>
                <td class="text-center"><?php if ($res->jenis_kelamin == "L") {
                                            echo 'Laki-Laki';
                                        } else {
                                            echo 'Perempuan';
                                        } ?></td>
                <td class="text-center">
                    <p data-placement="top" data-toggle="tooltip" title="Edit"><button data-aksi="siswa" data-nama="<?php echo $res->nama ?>" data-id="<?php echo $res->id_siswa ?>" data-status="<?php echo $res->status ?>" data-jk="<?php echo $res->jenis_kelamin ?>" data-tk="<?php echo $res->tingkat_kelas ?>" data-nis="<?php echo $res->nis ?>" class="edit-button btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit"><span class="glyphicon glyphicon-pencil"></span></button></p>
                </td>
                <td class="text-center">
                    <p data-placement="top" data-toggle="tooltip" title="Delete"><button data-aksi="siswa" data-id="<?php echo $res->id_siswa ?>" class="delete-button btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete"><span class="glyphicon glyphicon-trash"></span></button></p>
                </td>
            </tr>
<?php
            $index++;
        }
    }
    public function pdf()
    {
        $pdf = \App::make('dompdf.wrapper');
        $pdf->setPaper('A4', 'potrait');
        $pdf->loadHTML(view("layouts.pdf"));
        return $pdf->stream();
    }
}
