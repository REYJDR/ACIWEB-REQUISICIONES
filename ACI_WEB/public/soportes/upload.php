<?php

$req = $_POST['req'];
$dir = $_POST['dir'];

$target_dir = $dir."/".$req."/";

$process = '';

file_put_contents(getcwd()."/UPLOAD.log", '**********************************************************************'.PHP_EOL, FILE_APPEND); //LIMPIO EL ARCHIVO

  
if (!file_exists($target_dir)) {
    mkdir($target_dir, 0777, true);
    file_put_contents(getcwd()."/UPLOAD.log", date('dmY h:s:i').'- SE CREA CARPETA :'.$target_dir, FILE_APPEND); //LIMPIO EL ARCHIVO
    
}


$filename = $_FILES["file"]["name"] ;

file_put_contents(getcwd()."/UPLOAD.log", date('Y-m-d H:i:s').'- Se recibió el archivo: '.$filename.' para la carpeta: '.$target_dir.PHP_EOL, FILE_APPEND); //LIMPIO EL ARCHIVO

  
$target_file = $target_dir.basename($filename);


$uploadOk = 1;


// Check if file already exists
if (file_exists($target_file)) {
    $process .= "  Sorry, file already exists.<br>";
    file_put_contents(getcwd()."/UPLOAD.log", date('Y-m-d H:i:s').'- El archivo: '.$filename.' ya existe en la carpeta: '.$target_dir.PHP_EOL, FILE_APPEND); //LIMPIO EL ARCHIVO    
    $uploadOk = 0;
}

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    $process .= "  Sorry, your file was not uploaded.<br>";
    file_put_contents(getcwd()."/UPLOAD.log", date('Y-m-d H:i:s').'- Hubo un error al cargar el archivo: '.$filename.'  en la carpeta: '.$target_dir.PHP_EOL, FILE_APPEND); //LIMPIO EL ARCHIVO    
    
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
        $process .= "  The file ". basename($filename). " has been uploaded.";
        file_put_contents(getcwd()."/UPLOAD.log", date('Y-m-d H:i:s').'- El archivo: '.$filename.' se ha cargado  correctamente en la carpeta: '.$target_dir.PHP_EOL, FILE_APPEND); //LIMPIO EL ARCHIVO    
    
    } else {
        $process .= "  Sorry, there was an error uploading your file.<br>";
        file_put_contents(getcwd()."/UPLOAD.log", date('Y-m-d H:i:s').'- Hubo un error al cargar el archivo: '.$filename.'  en la carpeta: '.$target_dir.PHP_EOL, FILE_APPEND); //LIMPIO EL ARCHIVO    
        
    }
}
file_put_contents(getcwd()."/UPLOAD.log", '**********************************************************************'.PHP_EOL, FILE_APPEND); //LIMPIO EL ARCHIVO

  

echo  '/'.$process;





?>