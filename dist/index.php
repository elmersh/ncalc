<?php
   session_start();
   require '../source/functions.php';
   require '../vendor/autoload.php';
   require '../source/bootstrap.php';

   $router = new Router($tpl, $u);


   Router::load('../routes.php')
        ->direct(Request::uri(), Request::method());

