<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Kategori</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
</head>
<body>
    <?= view('components/navbar', ['active' => 'profile']) ?>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h4 class="mb-0"><i class="bi bi-box-seam"></i> Data Kategori</h4>
                        <div>
                            <?php if (session()->get('role') === 'Admin'): ?>
                            <a href="/category/create" class="btn btn-success btn-sm">
                                <i class="bi bi-plus-circle"></i> Tambah Kategori
                            </a>
                            <?php endif; ?>
                        </div>
                    </div>
                    <div class="card-body">
                        <?php if (session()->getFlashdata('error')): ?>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <?= session()->getFlashdata('error') ?>
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        <?php endif; ?>

                        <?php if (session()->getFlashdata('success')): ?>
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <?= session()->getFlashdata('success') ?>
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        <?php endif; ?>

                        <!-- Table -->
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead class="table-dark">
                                    <tr>
                                        <th width="5%">No</th>
                                        <th width="15%"> Nama Kategori</th>
                                        <?php if (session()->get('role') === 'Admin'): ?>
                                        <th width="17%">Aksi</th>
                                        <?php endif; ?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (empty($category)): ?>
                                        <tr>
                                            <td colspan="8" class="text-center">Tidak ada data kategori</td>
                                        </tr>
                                    <?php else: ?>
                                        <?php $no = 1; foreach ($category as $c): ?>
                                        <tr>
                                            <td><?= $no++ ?></td>
                                            <td><?= esc($c['nama_category']) ?></td>
                                            <?php if (session()->get('role') === 'Admin'): ?>
                                            <td>
                                                <a href="/category/edit/<?= $c['id_category'] ?>" class="btn btn-sm btn-warning">
                                                    <i class="bi bi-pencil"></i> Edit
                                                </a>
                                                <a href="/category/delete/<?= $c['id_category'] ?>" 
                                                   class="btn btn-sm btn-danger"
                                                   onclick="return confirm('Yakin hapus data Kategori ini?')">
                                                    <i class="bi bi-trash"></i> Hapus
                                                </a>
                                            </td>
                                            <?php endif; ?>
                                        </tr>
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
