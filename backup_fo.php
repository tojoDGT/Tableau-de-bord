<?php

//phpinfo();

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$database = 'cnfifo';
$user = 'tojo';
$pass = 't0joCNf1!';
$host = '10.2.206.75';
$dir = dirname(__FILE__) . '/dump/dump3.sql';

echo "<h3>Backing up database to `<code>{$dir}</code>`</h3>";

exec("mysqldump --user={$user} --password={$pass} --host={$host} {$database} --result-file={$dir} 2>&1", $output);

var_dump($output);