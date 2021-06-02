<?php

use function ezsql\functions\column;
use function ezsql\functions\eq;
use function ezsql\functions\grouping;
use function ezsql\functions\leftJoin;
use function ezsql\functions\like;
use function ezsql\functions\primary;
use function ezsql\functions\set_table;
use function ezsql\functions\where;
use function ezsql\functions\inserting;

class NotasController
{
    private $tpl, $u;

    function __construct($tpl, $u)
    {
        $this->tpl = $tpl;
        $this->u = $u;
    }

    public function agregar()
    {
        global $db;
        set_table('materias');
        $db->prepareOn();
        (isset($this->u['id']))?: header('Location: /ingresar');

        $errors = [];
        if(isset($_GET['id'])){
          $idMateria = trim($_GET['id']);
        } else {
          $idMateria = trim($_POST['idMateria']);
        }
        // $materia = $db->get_row("SELECT * from materias where id = " . $idMateria);
        $materia = $db->selecting(  'nombre, id', where( eq('id', $idMateria)));

        $this->tpl->assign('materia', $materia[0]);
            
        

        if(isset($_POST['submit'])){
          
          if(isset($_POST['nota'], $_POST['ponderacion'], $_POST['unidad']) && $_POST['unidad'] != "0" && $_POST['ponderacion'] != "0") {
            
            $nota = trim($_POST['nota']);
            $ponderacion = trim($_POST['ponderacion']);
            $unidad = trim($_POST['unidad']);
          } else {
              $errors[] = "Todos los campos son requeridos";
          }

          if(isset($nota)){
              $checkUnidad = $db->get_var("SELECT * FROM notas where id_materia = " . $idMateria . " AND id_usuario = " . $this->u['id'] . " AND unidad = '" . $unidad ."'");


            if ($checkUnidad) {
              $errors[] = "Ya existe una nota para esta unidad";
            }
          }

          

          if(empty($errors)){
              $db->insert("notas", [
              'nota' => $nota,
              'ponderacion' => $ponderacion,
              'id_materia' => $idMateria,
              'id_usuario' => $this->u['id'],
              'unidad' => $unidad
            ] );
            header('Location: /materias/mostrar/?id='.$idMateria);
          }
        }
        if(!empty($errors)){
          $this->tpl->assign('errors', $errors);
        }
        $this->tpl->display('notas/add.tpl');
    }

}