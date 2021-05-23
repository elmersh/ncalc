<?php

class PagesController
{
  private $tpl;
  function __construct($tpl)
  {
    $this->tpl = $tpl;
  }

  public function home()
  {
    $materias = App::get('db')->mostrarTodos('materia');
    $this->tpl->assign('materias', $materias);
    $this->tpl->display('index.tpl');
  }

  public function registro() {
    if(isset($_POST['email'])){

      $clave = $_POST['password'];
      $claveEncriptada = password_hash($clave, PASSWORD_DEFAULT);

      App::get('db')->guardar('usuario', [
        'nombre' => $_POST['nombre'],
        'email' => $_POST['email'],
        'clave' => $claveEncriptada
      ]);

      header('Location: /');
    } else {
      $this->tpl->display('register.tpl');
    }

  }
}