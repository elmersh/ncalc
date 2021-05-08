<?php

class Router
{
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
        $router = new static;

        require $file;

        return $router;
    }

    public function direct($uri, $reqType)
    {
        if(array_key_exists($uri, $this->routes[$reqType])) {
            return $this->routes[$reqType][$uri];
        }

        throw new Exception('No routes found');
    }
}