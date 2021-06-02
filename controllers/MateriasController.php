<?php

use function ezsql\functions\eq;

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
      global $db;
    (isset($this->u['id']))?: header('Location: /ingresar');

    $materias = $db->get_results("SELECT * FROM materias WHERE id_usuario = ". $this->u['id']);

    $this->tpl->assign('materias', $materias);
    $this->tpl->display('materias.tpl');
  }

  public function mostrar()
  {
      global $db;

    (isset($this->u['id']))?: header('Location: /ingresar');

    if(isset($_POST['submit'])){
      $notaid = trim($_POST['notaid']);
      $materiaid = trim($_POST['materiaid']);
      $userid = trim($_POST['userid']);

      $db->query("DELETE FROM notas where id = " . $notaid . " AND id_materia = " . $materiaid . " AND id_usuario = " . $userid );

      header('Location: /materias/mostrar?id='.$materiaid);
    }
    
    $id = trim($_GET['id']);
    $materia = $db->get_row("SELECT * FROM materias WHERE id = " . $id);


    $notas = $db->get_results("SELECT * FROM notas WHERE id_usuario = " . $this->u['id'] . " AND id_materia = " . $id);

    $this->tpl->assign('notas', $notas);
    $this->tpl->assign('materia', $materia);
    $this->tpl->display('materias/mostrar.tpl');
  }

  public function registrar(){
      global $db;
      (isset($this->u['id']))?: header('Location: /ingresar');
      $errors = [];

    if(isset($_POST['submit'])){
      if(isset($_POST['nombre'], $_POST['codigo'])) {
        $nombre = trim($_POST['nombre']);
        $codigo = trim($_POST['codigo'], " ");
      }

      if(isset($_POST['horario'])){
          $horario = trim($_POST['horario']);
      } else {
          $errors[] = "Elegir un ciclo";
      }

      if(empty($errors)){
          $db->insert('materias', [
            'nombre' => $nombre,
            'codigo' => $codigo,
            'horario' => $horario,
            'id_usuario' => $this->u['id']
          ]);
        header('Location: /materias');
        }
    }
    if(!empty($errors)){
      $this->tpl->assign('errors', $errors);
    }
    $this->tpl->display('materias/registrar.tpl');
  }


  public function editar(){
      global $db;
    (isset($this->u['is_admin']) && $this->u['is_admin'] == true) ?: header('Location: /ingresar');
      if(isset($_GET['id'])){
          $matId = trim($_GET['id']);
      }

      if(isset($_POST['submit'])) {
        $id = trim($_POST['id']);
        $nombre = trim($_POST['nombre']);
        $codigo = trim($_POST['codigo'], " ");
        $horario = trim($_POST['horario']);

        $db->update("materias", [
            'nombre' => $nombre,
            'codigo' => $codigo,
            'horario' => $horario
        ], eq('id', $id));
          header('Location: /materias');
      }
      //$materia = App::get('db')->mostrarPorId('materias', $matId)->fetch();
      $materia = $db->select('materias', '*', eq('id', $matId));

      if($materia){
          $this->tpl->assign('materia', $materia[0]);
      }
    $this->tpl->display('materias/editar.tpl');
  }
  public function borrar() {
      global $db;
    if(isset($_POST['id'])){
      $materia = $db->select("materias", "id_usuario", eq("id_usuario", $this->u['id'], _AND), eq("id", $_POST['id']));

      $canDelete = false;

      if((isset($materia[0]->id_usuario) && $materia[0]->id_usuario == $this->u['id'])){
        $canDelete = true;
      }

      if($this->u['is_admin']){
        $canDelete = true;
      }

      if($canDelete){
      $id = trim($_POST['id']);
      $db->delete("materias", eq('id', $id));
      } else {
        Header('Location: /dashboard');
      }
     
      
    }
    if(isset($_POST['admDelete'])){
      header('Location: /admin');
    } else {
      header('Location: /materias');
    }
  }

}