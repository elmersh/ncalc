<?php


$grades = $app['db']->getAll('grades');
$materias = $app['db']->getAll('materia');

$smarty->assign('materias', $materias);
$smarty->assign('grades', $grades);

$smarty->display('materias.tpl');