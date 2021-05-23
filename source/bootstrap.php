<?php

App::bind('config', require 'config.php');
App::bind('db', new Db(
Db::connect(
  App::get('config')['database'])
));

    $tpl = new Smarty();
    $tpl->setTemplateDir('/Users/elmo/dev/me/utec/gcalc/views/templates');
    $tpl->setCompileDir('/Users/elmo/dev/me/utec/gcalc/views/templates_c');
    $tpl->setCacheDir('/Users/elmo/dev/me/utec/gcalc/views/cache');
    $tpl->setConfigDir('/Users/elmo/dev/me/utec/gcalc/views/config');
