<?php
require 'config.php';
class Db
{
    protected $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }
    public static function connect($config) {
        try {
            return new PDO(
                $config['connection'].';dbname=' . $config['dbname'],
                $config['username'],
                $config['password'],
                $config['options']
            );
        } catch (PDOException $e) {
            die($e->getMessage());
        }
    }

    public function mostrarTodos($table){
        $consulta = $this->pdo->prepare("select * from {$table}");
        $consulta->execute();
        $consulta->setFetchMode(PDO::FETCH_LAZY);

        return $consulta;
    }

     public function mostrarPorId($table, $id){
      $sql = "select * from {$table} where id = :id";
      $valores = [':id' => $id];
      $consulta = $this->pdo->prepare($sql);
      $consulta->execute($valores);

        return $consulta;
    }

     public function userInfo($table, $email){
      $sql = "select * from {$table} where email = :email";
      $valores = [':email' => $email];
      $consulta = $this->pdo->prepare($sql);

      $consulta->execute($valores);

        return $consulta;
    }
    public function borrar($table, $id){
      $sql = "delete from {$table} where id = :id";
      $valores = [':id' => $id];
      $consulta = $this->pdo->prepare($sql);

      try{
        $consulta->execute($valores);
      } catch (Exception $e) {
        dd($e);
      }
    }
    public function guardar($table, $parametros) {
      $sql = sprintf(
        'insert into %s (%s) values (%s)',
        $table,
        implode(', ', array_keys($parametros)),
        ':' . implode(', :', array_keys($parametros))
      );

      try {
        $consulta = $this->pdo->prepare($sql);
        $consulta->execute($parametros);
        return $this->pdo->lastInsertId();
      } catch (Exception $e) {
        die('Recorcholis! algo salió mal!');
      }
    }

}