<?php

       $router->get('', 'PagesController@home');
       $router->get('dashboard', 'PagesController@dashboard');
       //$router->get('admin', 'AdminController@home');
       $router->get('crear-cuenta', 'PagesController@registro');
       $router->get('ingresar', 'PagesController@ingresar');
       $router->get('salir', 'PagesController@salir');

       $router->post('crear-cuenta', 'PagesController@registro');
       $router->post('ingresar', 'PagesController@ingresar');


       // Materias
       $router->get('materias', 'MateriasController@home');
       $router->post('materias', 'MateriasController@borrar');
       $router->get('materias/registrar', 'MateriasController@registrar');
       $router->post('materias/registrar', 'MateriasController@registrar');
