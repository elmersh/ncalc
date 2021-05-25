<?php

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
    if(isset($_SESSION['id'])) {
      header('Location: /dashboard');
    }

    $this->tpl->display('index.tpl');
  }
  public function dashboard()
  {
    if(!isset($this->u['id'])) {
      header('Location: /ingresar');
    }
    $this->tpl->display('dashboard.tpl');
  }
  /*
   * Login usuario
   */
  public function ingresar() {
    $errors = [];
    if(isset($_POST['email']) && isset($_POST['clave'])) {
      $email = trim($_POST['email']);
      $clave = trim($_POST['clave']);
      (filter_var($email, FILTER_VALIDATE_EMAIL)) ?: $errors[] = "Email no válido";
      $consulta = App::get('db')->userInfo('usuarios', $email);
      $usuario = $consulta->fetch();

      if(isset($usuario['clave'])){
        (password_verify($clave, $usuario['clave']) == true)
        ?:$errors[] = "Usuario o contraseña no válidos";
      } else {
        $errors[] = "Usuario o contraseña no válidos";
      }

      if(empty($errors)) {
        $errors[] = $consulta->rowCount();
          session_regenerate_id();
         $_SESSION['autenticado'] = TRUE;
         $_SESSION['id'] = $usuario['id'];
         $_SESSION['email'] = $email;
         $_SESSION['nombre'] = $usuario['nombre'];

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

    if(isset($_POST['submit'])){
      if(isset($_POST['nombre'], $_POST['email'], $_POST['clave'])) {
        $nombre = trim($_POST['nombre']);
        $email = trim($_POST['email']);
        $clave = trim($_POST['clave']);

        $claveEncriptada = password_hash($clave, PASSWORD_BCRYPT, ['cost'=>4]);


         (filter_var($email, FILTER_VALIDATE_EMAIL) == $email) ?: $errors[] = "El correo no es válido.";
         ($clave > 5) ?: $errors[] = "La contraseña debe tener 6 o más letras.";
         if(empty($errors)){
           $consulta = App::get('db')->userInfo('usuarios', $email);
         }
         (isset($consulta) && $consulta->rowCount() == 0) ? : $errors[] = "El correo  ya está en uso";

         if(empty($errors)){
           $id = App::get('db')->guardar('usuarios',[
             'nombre' => $_POST['nombre'],
             'email' => $_POST['email'],
             'clave' => $claveEncriptada
           ]);

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