<?php
  use ezsql\Database;


  App::bind('config', require 'config.php');
  // App::bind('db', new Db(
  // Db::connect(
  //   App::get('config')['database'])
  // ));
  $db = Database::initialize('pdo', [
      'pgsql:host=127.0.0.1;dbname=ncalc',
      'postgres',
      ''
    ]);

  $tpl = new Smarty();
//  $tpl->left_delimiter="{%";
//  $tpl->right_delimiter="%}";
  $tpl->setTemplateDir(__DIR__ . '/../views/templates');
  $tpl->setCompileDir(__DIR__ . '/../views/templates_c');
  $tpl->setCacheDir(__DIR__ . '/../views/cache');
  $tpl->setConfigDir(__DIR__ . '/../views/config');
  $tpl->setPluginsDir(__DIR__ . '/../views/plugins');

  
  $u = [];
  if(in()) {
    $u = [
      'id' => $_SESSION['id'],
      'nombre' => $_SESSION['nombre'],
      'email' => $_SESSION['email'],
      'is_admin' => $_SESSION['is_admin']
    ];
      

      $tpl->assign('u', $u);
  }