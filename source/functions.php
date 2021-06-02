<?php


  function dd($data) {
    $html = '<pre>' . var_dump($data) . '</pre>';
    die($html);
  }


  function in(){
    return (isset($_SESSION['id']))?true:false;
  }

  function is_admin(){
    return (isset($_SESSION['is_admin']))?true:false;
  }

function smarty_function_avatar($params, &$smarty)
{
  // check for email adress
  if (!isset($params['email']) && !isset($params['default'])) {
    $smarty->trigger_error("gravatar: neither 'email' nor 'default' attribute passed");
    return;
  }

  $email = (isset($params['email']) ? trim(strtolower($params['email'])) : '');
  $rating = (isset($params['rating']) ? $params['rating'] : 'R');
  $url = "https://www.gravatar.com/avatar/" . md5($email) . "?r=" . $rating;

  if (isset($params['default']))
  $url .= "&d=" . urlencode($params['default']);
  if (isset($params['size']))
  $url .= "&s=" . $params['size'];

  if (isset($params['assign'])) {
    $smarty->assign($params['assign'], $url);
    return;
  }

  return $url;
}