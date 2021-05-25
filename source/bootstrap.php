<?php

  App::bind('config', require 'config.php');
  App::bind('db', new Db(
  Db::connect(
    App::get('config')['database'])
  ));
  $tpl = new Smarty();
//  $tpl->left_delimiter="{%";
//  $tpl->right_delimiter="%}";
  $tpl->setTemplateDir(__DIR__ . '/../views/templates');
  $tpl->setCompileDir(__DIR__ . '/../views/templates_c');
  $tpl->setCacheDir(__DIR__ . '/../views/cache');
  $tpl->setConfigDir(__DIR__ . '/../views/config');

  if(isset($_SESSION['id'])){
    $avatar = new Gravatar($_SESSION['email']);
    $tpl->assign('avatar', $avatar);
  }

  $u = [];
  if(in()) {
      $u = [];
      $u['id'] = $_SESSION['id'];
      $u['nombre'] = $_SESSION['nombre'];
      $u['email'] = $_SESSION['email'];

      $tpl->assign('u', $u);
  }