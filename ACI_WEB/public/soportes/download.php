<?php

$req = trim($_POST['req']);
$file = trim($_POST['file']);
$dir  = getcwd()."/".$req."/".$file;

if (file_exists($dir)) {
    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename="'.basename($file).'"');
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . filesize($dir));
    readfile($dir);
    exit;
}


?>
