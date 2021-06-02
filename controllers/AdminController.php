<?php

use function ezsql\functions\eq;
use function ezsql\functions\leftJoin;
use function ezsql\functions\set_table;
use function ezsql\functions\where;

class AdminController
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
    (isset($this->u['is_admin']) && $this->u['is_admin'] == true)?: header('Location: /ingresar');

    $usuarios = $db->get_results("SELECT * FROM usuarios left join rangos on usuarios.id_rango = rangos.id  order by usuarios.id desc limit 6");


    $materias = $db->get_results("SELECT * FROM materias order by id desc limit 6");
    $this->tpl->assign('usuarios', $usuarios);
    $this->tpl->assign('materias', $materias);
    $this->tpl->display('admin/home.tpl');
  }
}