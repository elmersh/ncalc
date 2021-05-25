<?php

class MateriasController
{
  private $tpl, $u;

  function __construct($tpl, $u)
  {
    $this->tpl = $tpl;
    $this->u = $u;
  }

  public function home()
  {
    (isset($this->u['id']))?: header('Location: /ingresar');

    $materias = App::get('db')->mostrarTodos('materias');
    $this->tpl->assign('materias', $materias);
    $this->tpl->display('materias.tpl');
  }

  public function registrar(){
    if(isset($_POST['submit'])){
      if(isset($_POST['nombre'], $_POST['codigo'], $_POST['ciclos'])) {
        $nombre = trim($_POST['nombre']);
        $codigo = trim($_POST['codigo']);
        $ciclo = trim($_POST['ciclos']);

        (!$ciclo) ?: $errors[] = "Elegir un ciclo";
        dd($errors);

        if(empty($errors)){
           App::get('db')->guardar('materias',[
             'nombre' => $nombre,
             'email' => $codigo,
             'ciclos' => $ciclo
           ]);
          header('Location: /materias');
         }
      }
    }
    if(isset($errors)){
      $this->tpl->assign('errors', $errors);
    }
    $this->tpl->display('materias/registrar.tpl');
  }

  public function borrar() {
    if(isset($_POST['id'])){
      $id = trim($_POST['id']);
      App::get('db')->borrar('materias', $id);
    }
    header('Location: /materias');
  }

}