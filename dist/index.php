<?php



   require '../vendor/autoload.php';

   require '../source/bootstrap.php';

   $router = new Router($tpl);


   Router::load('../routes.php')
        ->direct(Request::uri(), Request::method());

