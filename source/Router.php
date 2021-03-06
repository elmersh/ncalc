<?php

class Router
{
  private static $tpl;
  private static $u;

  public function __construct($tpl, $u) {
    self::$tpl = $tpl;
    self::$u = $u;
  }
    public $routes = [
        'GET' => [],
        'POST' => []
    ];

    public function get($uri, $controller)
    {
        $this->routes['GET'][$uri] = $controller;
    }

    public function post($uri, $controller)
    {
        $this->routes['POST'][$uri] = $controller;
    }

    public static function load($file)
    {
        $router = new static(self::$tpl, self::$u);

        require $file;

        return $router;
    }

    public function direct($uri, $reqType)
    {

        if(array_key_exists($uri, $this->routes[$reqType])) {
          return $this->callAction(...explode('@', $this->routes[$reqType][$uri]));
        }

        throw new Exception('No routes found');
    }

    protected function callAction($controller, $action)
    {

      if(! method_exists($controller, $action)) {
        throw new Exception(
          "{$controller} no responde a la acción {$action}"
        );
      }

      return (new $controller(self::$tpl, self::$u))->$action();
    }
}