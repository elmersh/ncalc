<?php
   $query = require 'source/bootstrap.php';

   $router = new Router;

//   require $router->direct($uri);
    require Router::load('routes.php')->direct(Request::uri(), Request::method());