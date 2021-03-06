<?php
global $n3s_config;

// redirect HTTP => HTTPS
if (empty($_SERVER['HTTPS']) &&
    ($_SERVER['HTTP_HOST'] == 'nadesi.com')) {
  $url = 'https://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
  header("location: $url");
  exit;
}


// read config file (差分のみ ... 主に app/index.inc.php で指定)
$root = dirname(__FILE__);
$n3s_config = array(
  'agent' => 'web',
  'dir_app' => $root.'/app',
);

// config parameters see lib/index.inc.php
$config_file = "$root/n3s_config.ini.php";
if (file_exists($config_file)) include_once($config_file);

// execute main file
$main_file = $n3s_config['dir_app'].'/index.inc.php';
include_once($main_file);
