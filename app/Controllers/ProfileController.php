<?php

namespace App\Controllers;

use App\Models\UserModel;
use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;

class ProfileController extends BaseController
{
    public function index()
    {
        $userModel = new UserModel();

        $user = $userModel->find(session()->get('id_user'));

        return view('profile/index', ['user' => $user]);
    }

    public function edit()
    {
        $userModel = new UserModel();

        $user = $userModel->find(session()->get('id_user'));

        return view('/profile/edit', ['user' => $user]);
    }

    public function update()
    {
        $userModel = new UserModel();
        $id = session()->get('id_user');

        // Data yang akan diupdate
        $updateData = [
            'nama'   => $this->request->getPost('nama'),
            'no_hp'  => $this->request->getPost('no_hp'),
            'alamat' => $this->request->getPost('alamat')
        ];

        $userModel->update($id, $updateData);

        // Update session nama jika nama berubah
        session()->set('nama', $updateData['nama']);

        log_activity('Mengupdate profile');

        return redirect()->to('/profile')->with('success', 'Profile berhasil diperbarui');
    }
}
