<?php

class test extends Controller
{

public function index($temp_url=''){

	$temp_url = "";
        // load views
        require APP . 'view/_templates/header.php';
        require APP . 'view/operaciones/test.php';
        require APP . 'view/_templates/footer.php';
}



	

}