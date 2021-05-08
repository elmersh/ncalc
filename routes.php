<?php
//  $router->define ([
//       '' => 'controllers/index.php',
//       'admin' => 'controllers/admin/index.php',
//       'admin/adduser' => 'controllers/admin/addmateria.php',
//       'materias' => 'controllers/materias.php'
//   ]);

       $router->get('', 'controllers/index.php');
       $router->get('admin', 'controllers/admin/index.php');
       $router->get('admin/adduser', 'controllers/admin/addmateria.php');
       $router->get('materias', 'controllers/materias.php');
       $router->get('admin/materia/add', 'controllers/admin/addmateria.php');
       $router->post('admin/materia', 'controllers/admin/addmateria.php');