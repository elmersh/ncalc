<?php


class App
{
  protected static $registro = [];

  public static function bind($key, $value){
    static::$registro[$key] = $value;
  }

  public static function get($key)
  {
    if (!array_key_exists($key, static::$registro)) {
      throw new Exception("La configración no contiene la llave {$key}");
    }
    return static::$registro[$key];
  }
}