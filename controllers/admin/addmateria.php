<?php
if(isset($_POST['nombre'])) {
    $app['database']->insert('materia', [
        'nombre' => $_POST['nombre'],
        'codigo' => $_POST['codigo']
    ]);
} else {
    $smarty->display('admin/add-materia.tpl');
}
