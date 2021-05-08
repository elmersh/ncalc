<?php
$smarty->assign('materias', $app['db']->getAll('materia'));

$smarty->display('materias.tpl');