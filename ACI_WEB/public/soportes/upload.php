<?php

$req = $_POST['req'];
$target_dir = getcwd()."/".$req."/";


if (!file_exists($target_dir)) {
    mkdir($target_dir, 0777, true);
}


var_dump($_FILES);

$count=0;
foreach ($_FILES["fileToUpload"]["name"] as $filename) 
{

    $target_file = $target_dir . basename($filename);
    $uploadOk = 1;


    // Check if file already exists
    if (file_exists($target_file)) {
        echo "  Sorry, file already exists.<br>";
        $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        echo "  Sorry, your file was not uploaded.<br>";
    // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"][$count], $target_file)) {
            echo "  The file ". basename($filename). " has been uploaded.";
        } else {
            echo "  Sorry, there was an error uploading your file.<br>";
        }
    }

  $count=$count + 1;

}





?>