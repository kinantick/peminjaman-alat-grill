<?php

namespace App\Controllers;

use App\Models\AlatModel;
use App\Models\UserModel;
use App\Models\CategoryModel;
use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;

class AlatController extends BaseController
{
    public function index()
    {
        $alatModel = new AlatModel();
        $categoryModel = new CategoryModel();

        $keyword = $this->request->getGet('keyword');
        $category = $this->request->getGet('category');

        $alat = $alatModel->getAlatFiltered($keyword, $category);

        $data = [
            'title'     => 'Alat',
            'alat'      => $alatModel->getAlatWithCategory(),
            'category'  => $categoryModel->findAll(),
            'keyword'   => '',
            'catFilter' => $category
        ];

        return view('/alat/index', $data);
    }

    public function create()
    {
        $categoryModel = new CategoryModel();
        $data['category'] = $categoryModel->findAll();

        return view('/alat/create', $data);
    }

    public function store()
    {
        $alatModel = new AlatModel();

        $id = $alatModel->insert([
            'nama_alat'   => $this->request->getPost('nama_alat'),
            'id_category' => $this->request->getPost('id_category'),
            'harga_alat'  => $this->request->getPost('harga_alat'),
            'kondisi'     => $this->request->getPost('kondisi'),
            'stok'        => $this->request->getPost('stok'),
            'status'      => $this->request->getPost('status')
        ]);

        log_activity('Menambahkan alat baru: ' . $this->request->getPost('nama_alat'), $id);

        return redirect()->to('/alat')->with('success', 'Alat Baru Berhasil Ditambahkan!');
    }

    public function edit($id)
    {
        $alatModel = new AlatModel();
        $categoryModel = new CategoryModel();

        return view('/alat/edit', [
            'alat'     => $alatModel->find($id),
            'category' => $categoryModel->findAll()
        ]);
    }

    public function update($id)
    {
        $alatModel = new AlatModel();

        $alat = $alatModel->find($id);

        $alatModel->update($id, [
            'nama_alat'   => $this->request->getPost('nama_alat'),
            'id_category' => $this->request->getPost('id_category'),
            'harga_alat'  => $this->request->getPost('harga_alat'),
            'kondisi'     => $this->request->getPost('kondisi'),
            'stok'        => $this->request->getPost('stok'),
            'status'      => $this->request->getPost('status')
        ]);

        log_activity('Mengupdate data alat: ' . $alat['nama_alat'], $id);

        return redirect()->to('/alat')->with('success', 'Data Berhasil Update');
    }

    public function delete($id)
    {
        $alatModel = new AlatModel();
        $alat = $alatModel->find($id);
        
        $alatModel->delete($id);

        log_activity('Memindahkan alat ke trash: ' . $alat['nama_alat'], $id);

        return redirect()->to('/alat')->with('success', 'Alat berhasil dipindahkan ke trash');
    }
}
