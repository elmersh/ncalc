<?php

       $router->get('', 'PagesController@home');
       //$router->get('admin', 'AdminController@home');
       $router->get('crear-cuenta', 'PagesController@registro');

       $router->post('registro', 'PagesController@registro');

       $router->get('materias', 'PagesController@materias');