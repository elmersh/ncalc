<?php
    $app = [];
    require '/Users/elmo/dev/me/utec/workbook/vendor/autoload.php';

    $smarty = new Smarty();

    $smarty->setTemplateDir('/Users/elmo/dev/me/utec/workbook/views/templates');
    $smarty->setCompileDir('/Users/elmo/dev/me/utec/workbook/views/templates_c');
    $smarty->setCacheDir('/Users/elmo/dev/me/utec/workbook/views/cache');
    $smarty->setConfigDir('/Users/elmo/dev/me/utec/workbook/views/config');

    $app['config'] = require 'config.php';
    require 'Request.php';
    require 'Router.php';
    require 'functions.php';
    require 'Db.php';
    $app['db'] = new Db(Db::connect($app['config']['database']));