<div class="container">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800"><?= $title ?></h1>
          <hr/>
    <a href="<?= base_url('admin/data_petugas'); ?>" class="btn btn-sm btn-secondary">
    Kembali
    </a>
        <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="p-5">
                                <?= $this->session->flashdata('message'); ?>
                                <form method="post" action="<?= base_url('admin/ubah_petugas'); ?>">
                                    <div class="form-group ">
                                        <input type="hidden" id="id" name="id" value="<?= $petugas['id_petugas']; ?>">
                                    </div>
                                    <div class="form-group ">
                                        <input type="text" class="form-control form-control-user" id="nama" name="nama" value="<?= $petugas['nama_petugas']; ?>">
                                        <?= form_error('nama', '<small class="text-danger pl-3">', '</small>');
                                        ?>
                                    </div>
                                    <div class="form-group ">
                                        <input type="text" class="form-control form-control-user" id="telp" name="telp" value="<?= $petugas['telp']; ?>">
                                        <?= form_error('telp', '<small class="text-danger pl-3">', '</small>');
                                        ?>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-sm btn-primary">
                                            Ubah
                                        </button>
                                    </div>
                                </form>
                                <br>
                            </div>
                        </div>
                    </div>
        </div>

</div>