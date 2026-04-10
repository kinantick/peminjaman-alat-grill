<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;
use App\Models\CategoryModel;

class CategoryController extends BaseController
{
    public function index()
    {
        $categoryModel = new CategoryModel();
        
        $data['category'] = $categoryModel->findAll();
        
        return view('/category/index', $data);
    }

    
    public function create()
    {
        return view('/category/create');
    }

    public function store()
    {
        $categoryModel = new CategoryModel();

        $id = $categoryModel->insert([
            'nama_category'   => $this->request->getPost('nama_category')
        ]);

        log_activity('Menambahkan kategori baru: ' . $this->request->getPost('nama_category'), $id);

        return redirect()->to('/category')->with('success', 'Kategori Baru Berhasil Ditambahkan!');
    }

    public function edit($id)
    {
        $categoryModel = new CategoryModel();

        return view('/category/edit', [
            'category'     => $categoryModel->find($id)
        ]);
    }

    public function update($id)
    {
        $categoryModel = new CategoryModel();

        $category = $categoryModel->find($id);

        $categoryModel->update($id, [
            'nama_category'   => $this->request->getPost('nama_category'),
            'id_category' => $this->request->getPost('id_category')
        ]);

        log_activity('Mengupdate data category: ' . $category['nama_category'], $id);

        return redirect()->to('/category')->with('success', 'Data Berhasil Update');
    }

    public function delete($id)
{
    $categoryModel = new \App\Models\CategoryModel();
    $alatModel = new \App\Models\AlatModel();

    if ($alatModel->where('id_category', $id)->countAllResults() > 0) {
        return redirect()->back()->with('error', 'Kategori tidak bisa dihapus karena masih ada data alat dengan kategori ini!');
    }

    try {
        $categoryModel->delete($id);
        return redirect()->back()->with('success', 'Kategori berhasil dihapus!');
    } catch (\Exception $e) {
        return redirect()->back()->with('error', 'Gagal menghapus kategori!');
    }
}
}
