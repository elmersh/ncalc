<?php
use function ezsql\functions\eq;
use function ezsql\functions\leftJoin;
use function ezsql\functions\set_table;
use function ezsql\functions\where;

class PagesController
{
  private $tpl;
  private $u;

  function __construct($tpl, $u)
  {
    $this->tpl = $tpl;
    $this->u = $u;
  }

  public function home()
  {
    (!isset($_SESSION['id'])) ?: header('Location: /dashboard');

    $this->tpl->display('index.tpl');
  }
  
  public function dashboard()
  {
    (isset($_SESSION['id'])) ?: header('Location: /ingresar');
      global $db;
    set_table('materias');
    if(!isset($this->u['id'])) {
      header('Location: /ingresar');
    }
    $results = $db->selecting('*',
    leftJoin('materias', 'notas', 'id', 'id_materia', 'mats', '='),
    where(eq('materias.id_usuario', $this->u['id']))
  );
  
    if(isset($results)) {
      $data = array();

      foreach ($results as $row) {
        $data[$row->nombre][$row->unidad]['unidad'] = $row->unidad;
        $data[$row->nombre][$row->unidad]['nota'] = $row->nota;
      }

      $this->tpl->assign('results', $data);
    }
    $this->tpl->display('dashboard.tpl');
  }

  /*
   * Login usuario
   */
  public function ingresar() {
    (!isset($_SESSION['id'])) ?: header('Location: /dashboard');
      global $db;
    $errors = [];
    if(isset($_POST['email']) && isset($_POST['clave'])) {
      $email = trim($_POST['email']);
      $clave = trim($_POST['clave']);
      (filter_var($email, FILTER_VALIDATE_EMAIL)) ?: $errors[] = "Email no válido";

      $usuario = $db->select('usuarios', 'id, clave, nombre, id_rango', eq('email', $email));

      if(isset($usuario[0]->clave)){
        (password_verify($clave, $usuario[0]->clave) == true)
        ?:$errors[] = "Usuario o contraseña no válidos";
      } else {
        $errors[] = "Usuario o contraseña no válidos";
      }

      if(empty($errors)) {
          session_regenerate_id();
        $_SESSION['autenticado'] = true;
        $_SESSION['id'] = $usuario[0]->id;
        $_SESSION['email'] = $email;
        $_SESSION['nombre'] = $usuario[0]->nombre;
        $_SESSION['is_admin'] = ($usuario[0]->id_rango == 4)?true:false;
          header('Location: /dashboard');
      }
    }

    if(isset($_SESSION['id'])){
      header('Location: /dashboard');
    }
      $this->tpl->assign('errors', $errors);
      $this->tpl->display('login.tpl');
  }

  /*
   * Salir si está en sesión
   */
  public function salir(){
    if(isset($_SESSION['id'])) {
      session_destroy();
      header('Location:  /');
    } else {
      header('Location:  /ingresar');
    }
  }

  /*
   * Registro de usuario
   */
  public function registro() {
    global $db;
    (!isset($_SESSION['id'])) ?: header('Location: /dashboard');
    if(isset($_POST['submit'])){
      if(isset($_POST['nombre'], $_POST['email'], $_POST['clave'])) {
        $nombre = trim($_POST['nombre']);
        $email = trim($_POST['email']);
        $clave = trim($_POST['clave']);

        $claveEncriptada = password_hash($clave, PASSWORD_BCRYPT, ['cost'=>4]);


         (filter_var($email, FILTER_VALIDATE_EMAIL) == $email) ?: $errors[] = "El correo no es válido.";
         ($clave > 5) ?: $errors[] = "La contraseña debe tener 6 o más letras.";
         if(empty($errors)){
           $consulta = $db->select('usuarios', 'id', eq('email', $email));

         }
         (!isset($consulta)) ? : $errors[] = "El correo  ya está en uso";

         if(empty($errors)){
           $db->insert('usuarios',[
             'nombre' => $_POST['nombre'],
             'email' => $_POST['email'],
             'clave' => $claveEncriptada
           ]);
             $id = $db->getInsertId();
          session_regenerate_id();
          $_SESSION['autenticado'] = TRUE;
          $_SESSION['id'] = $id;
          $_SESSION['email'] = $email;
          $_SESSION['nombre'] = $nombre;

          header('Location: /dashboard');
         }

      }
    }

    if(isset($errors)){
      $this->tpl->assign('errors', $errors);
    }
    $this->tpl->display('register.tpl');

  }
}