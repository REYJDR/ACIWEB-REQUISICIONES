<?php

$req  = trim($_REQUEST['req']);
$file = trim($_REQUEST['file']);

$dir  = getcwd()."/".$req."/".$file;
echo $dir;
// if (file_exists($dir)) {
//     header('Content-Description: File Transfer');
//     header('Content-Type: application/octet-stream');
//     header('Content-Disposition: attachment; filename="'.basename($dir).'"');
//     header('Expires: 0');
//     header('Cache-Control: must-revalidate');
//     header('Pragma: public');
//     header('Content-Length: ' . filesize($dir));
//     readfile($dir);
//     exit;
// }


?>
