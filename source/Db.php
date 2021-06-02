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
        $consulta = $this->pdo->prepare("select * from {$table} order by id asc");
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
    public function mostrarMaterias($table, $uid){
        $consulta = $this->pdo->prepare("select * from {$table} where id_usuario = {$uid} order by id asc");
        $consulta->execute();
        $consulta->setFetchMode(PDO::FETCH_LAZY);

        return $consulta;
    }
     public function mostrarNotas($table, $id, $uid){
      $sql = "select * from {$table} where id_materia = :id and id_usuario = :uid";
      $valores = [':id' => $id, ':uid' => $uid];
      $consulta = $this->pdo->prepare($sql);
      $consulta->execute($valores);
       $consulta->setFetchMode(PDO::FETCH_LAZY);

        return $consulta;
    }

    // Comprobar si existe nota para x unidad
    public function verificarUnidad($id_materia, $uid, $unidad) {
      $sql = "select * from notas where id_materia = :id_materia and id_usuario = :uid and unidad = :unidad";
      $valores = [':id_materia'=>$id_materia, ':uid' => $uid, ':unidad' => $unidad];
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
    public function borrarNota($table, $notaid, $materiaid, $userid){
      $sql = "delete from {$table} where id = :id and id_usuario = :userid";
      $valores = [':id' => $notaid, ':userid' => $userid];
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
        die($e);
      }
    }
    public function actualizarMateria($nombre, $codigo, $horario, $id) {
     $sql = "UPDATE materias SET nombre=?, horario=?, codigo=? WHERE id=?";

      try {
        $consulta = $this->pdo->prepare($sql);
        $consulta->execute([$nombre, $horario, $codigo, $id]);
      } catch (Exception $e) {
        die($e);
      }
    }

}

//$sql = 'UPDATE stocks '
//                . 'SET company = :company, '
//                . 'symbol = :symbol '
//                . 'WHERE id = :id';