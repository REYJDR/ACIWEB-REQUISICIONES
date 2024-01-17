<?PHP

class ges_requisiciones extends Controller
{

public $ProductID;

public function req_crear(){
 
$copy = '';

 $res = $this->model->verify_session();

        if($res=='0'){
        

            // load views
            require APP . 'view/_templates/header.php';
            require APP . 'view/_templates/panel.php';
            require APP . 'view/operaciones/req_crear.php';
            require APP . 'view/_templates/footer.php';


        }
          


	
}

public function req_hist(){


 $res = $this->model->verify_session();

        if($res=='0'){
        

            // load views
            require APP . 'view/_templates/header.php';
            require APP . 'view/_templates/panel.php';
            require APP . 'view/operaciones/req_hist.php';
            require APP . 'view/_templates/footer.php';


        }
	
}



public function req_copy($Id,$type){

    $res = $this->model->verify_session();
   
    if($res=='0'){
        
        $copy = 'X';
        
        if($type == 'REQ'){
            
            $ORDER = $this->model->get_req_to_print($Id);

        }else{

            $PO = $this->model->get_items_by_OC($Id);

            
        }



        // load views
        require APP . 'view/_templates/header.php';
        require APP . 'view/_templates/panel.php';
        require APP . 'view/operaciones/req_crear.php';
        require APP . 'view/_templates/footer.php';


    }


}


public function req_print($id,$Pay_flag,$urgent_flag){


 $res = $this->model->verify_session();

        if ($Pay_flag == 0) {
  
             $Pay_req = 'Si';
        }else{

              $Pay_req = 'No';
        }

        if ($urgent_flag == 0) {
  
          $isUrgent = 'Si';
        }else{

          $isUrgent = 'No';
        }


        if($res=='0'){

            $ORDER = $this->model->get_req_to_print($id);
  
            foreach ($ORDER as  $value) {

            $value = json_decode($value);

             $name = $this->model->Query_value('SAX_USER','name','Where ID="'.$value->{'USER'}.'"');
             $lastname =  $this->model->Query_value('SAX_USER','lastname','Where ID="'.$value->{'USER'}.'"');

             $Job= $value->{'JobID'};      
             $fase= $value->{'PhaseID'};
             $ccost= $value->{'CostCodeID'};
              
              $ref = $value->{'NO_REQ'};

              $rep = $name.' '.$lastname;

              $date = $value->{'DATE'};
              $date_ini = $value->{'DATE_INI'};
              $desc = $value->{'NOTA'};

              $descont = $value->{'descont'};



            }
        

            // load views
            require APP . 'view/_templates/header.php';
            require APP . 'view/_templates/panel.php';
            require APP . 'view/operaciones/req_print.php';
            require APP . 'view/_templates/footer.php';


        }


}


public function req_mailing($id,$flag,$Pay_flag){

 
 $res = $this->model->verify_session();

      if($res=='0'){


      require 'PHP_mailer/PHPMailerAutoload.php';
      $mail = new PHPMailer(true);


      $ORDER = $this->model->get_req_to_print($id);

            // load views
            require APP . 'view/_templates/header.php';
            require APP . 'view/_templates/panel.php';
            require APP . 'view/operaciones/req_mailing.php';
            require APP . 'view/_templates/footer.php';


        }


}

public function req_reception($id){


 $res = $this->model->verify_session();

      if($res=='0'){


            // load views
            require APP . 'view/_templates/header.php';
            require APP . 'view/_templates/panel.php';


 				ECHO '<input id="reqidhide" type="hidden" value="'.$id.'" />';

            require APP . 'view/operaciones/req_reception.php';
            require APP . 'view/_templates/footer.php';


        }


}

}

?>