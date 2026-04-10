<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Edit Kategori</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-4">
    <div class="card shadow-sm">
        <div class="card-body">
            <h3 class="mb-4">Edit Kategori</h3>

            <!-- FORM -->
            <form action="/category/update/<?= $category['id_category']; ?>" method="post">

                <div class="mb-3">
                    <label class="form-label fw-semibold">Nama Kategori <span class="text-danger">*</span></label>
                    <input type="text" name="nama_category" class="form-control" value="<?= esc($category['nama_category']); ?>" required>
                </div>

                

                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-warning">
                        Update
                    </button>
                    <a href="/category" class="btn btn-secondary">
                        Kembali
                    </a>
                </div>

            </form>

        </div>
    </div>
</div>

</body>
