<?php

$req = $_POST['req'];
$target_dir = getcwd()."/".$req."/";


if (!file_exists($target_dir)) {
    mkdir($target_dir, 0777, true);
}



$process = '';


$filename = $_FILES["file"]["name"] ;
  
$process .= $filename.'-';

$target_file = $target_dir . basename($filename);
$uploadOk = 1;


// Check if file already exists
if (file_exists($target_file)) {
    $process .= "  Sorry, file already exists.<br>";
    $uploadOk = 0;
}

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    $process .= "  Sorry, your file was not uploaded.<br>";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
        $process .= "  The file ". basename($filename). " has been uploaded.";
    } else {
        $process .= "  Sorry, there was an error uploading your file.<br>";
    }
}




echo  '/'.$process;





?>