<?php


  function dd($data) {
    $html = '<pre>' . var_dump($data) . '</pre>';
    die($html);
  }


  function in(){
    if(isset($_SESSION['id'])) {
      return true;
    }
    return false;
  }
