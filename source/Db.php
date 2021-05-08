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

    function getAll($table){
        $consulta = $this->pdo->prepare("select * from {$table}");
        $consulta->execute();
        $consulta->setFetchMode(PDO::FETCH_LAZY);

        return $consulta;
    }
}