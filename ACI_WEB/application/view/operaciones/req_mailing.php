<?php 


$meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");


//company
$comp = $this->model->Get_company_Info();

foreach ($comp as $value) {
    $value = json_decode($value);

    $address = $value->{'address'};
    $name = $value->{'company_name'};
    $tel= $value->{'Tel'};
    $fax = $value->{'Fax'};
}


//valores de la requisicion segun ID. 
foreach ($ORDER as  $value) {

    $value = json_decode($value);

    $name     =  $this->model->Query_value('SAX_USER','name','Where ID="'.$value->{'USER'}.'"');
    $lastname =  $this->model->Query_value('SAX_USER','lastname','Where ID="'.$value->{'USER'}.'"');

              
    $ref = $value->{'NO_REQ'};

    $rep = $name.' '.$lastname;

    $date = $value->{'DATE'};
    $date_ini = $value->{'DATE_INI'};
    $desc = $value->{'NOTA'};
    $descont = $value->{'descont'};
}



// <div  class="page-print col-xs-11">
// <div  class="col-xs-12">




if ($Pay_flag == 0) {
  
  $Pay_req = 'Si';
  $SubjectPay = ' - pago x adelantado ';

}else{

  $Pay_req = 'No';
   $SubjectPay = '';
}


if ($flag == 0) {
  
  $isUrgent = 'Si';
}else{

  $isUrgent = 'No';
}

$message .='<h2 class="h_invoice_header" >Requisicion</h2>
                 <table BORDER="1">
                    
                    <tr>
                      <th style="text-align:left;"><strong>Referencia:</strong>'.$ref.'</th>
                      
                    </tr>
                    <tr>
                      <th style="text-align:left;"><strong>Fecha solicitud:</strong>'.date('d/M/Y g:i a',strtotime($date)).'</th>
                      
                    </tr>
                    <tr>
                      <th style="text-align:left;"><strong>Fecha inicio actividad:</strong>'.date('d/M/Y',strtotime($date_ini)).'</th>
                      
                    </tr>
                    <tr>
                      <th style="text-align:left;"><strong>Solicitante: </strong>'.$rep.'</th>
                      
                    </tr>
                    <tr>
                      <th style="text-align:left;"><strong>Pago Adelantado: </strong>'.$Pay_req.'</th>
                      
                    </tr>
                    <tr>
                    <th style="text-align:left;"><strong>Para descontar a: </strong>'.$descont.'</th>
                    
                    </tr>
                    <tr>
                      <th style="text-align:left;"><strong>Requisicion Urgente: </strong>'.$isUrgent.'</th>
                      
                    </tr>
</table>
                  
<br>
                                             
                       
<TABLE   width="100%" border="1" >
   <TR >
    <TH width="100%">Descripcion</TH>
   </TR>
   <TR >
   <TD width="100%">'.$desc.'</TD>
  </TR>
</TABLE>

<br>                   

<TABLE   width="100%" border="1" >
<TR >
   <TH width="15%">Codigo</TH>
   <TH width="35%">Descripcion</TH>
   <TH width="10%">Cant.</TH>
   <TH width="10%">Uni.</TH>
   <TH width="10%">Proyecto</TH>
   <TH width="10%">Fase</TH>
   
    </TR>';

foreach ($ORDER as  $value) { 

$value = json_decode($value);  
 
$itemDesc = trim($value->{'DESCRIPCION'});

$message .= '<tr>
   <td width="15%" style="padding-right:10px; text-align: left;">'.$value->{'ProductID'}.'</td>
   <td width="35%" >'.$itemDesc.'</td>
   <td width="10%" class="numb" style="text-align: center;" >'.number_format($value->{'CANTIDAD'},2).'</td>
   <td width="10%" style="text-align: center;" >'.$value->{'UNIDAD'}.'</td>
   <td width="10%" style="text-align: center;" >'.$value->{'JOB'}.'</td>
   <td width="10%" style="text-align: center;" >'.$value->{'PHASE'}.'</td>
   
   </tr>';

}


$message .= '</table><BR><BR>';


$message .= '<a href="'.URL.'index.php?url=bridge_query/set_req_quota/'.$ref.'/'.$this->model->id_compania.'" type="button" id="cotizar" >INICIAR COTIZACION</a>';

$message_to_send ='<html>
<head>
<meta charset="UTF-8">
<title>Requisicion de materiales</title>
</head>
<body>'.$message.'</body>
</html>';

//VERIFICA USUARIOS CON OPCION D ENOTIFICACION DE ORDEN DE COMPRAS
$sql = 'SELECT name, lastname, email from SAX_USER WHERE notif_oc="1" and onoff="1"';
$address = $this->model->Query($sql);

$testemail = '';

if(isset($_GET['email'])){
  $testemail = $_GET['email'];
}
if(isset($_GET['debug'])){
  $debug = $_GET['debug'];
}

$sql = "SELECT * FROM CONF_SMTP WHERE ID='1'";
$smtp= $this->model->Query($sql);

$message_to_send = "<h1>test</h1>";

echo sendMessage( "rvallarino@contratistasciviles.com", $mail,$ref,$message_to_send , $address , $testemail, $flag, $smtp, $debug);



function sendMessage($fromEmail, $mailerObject, $ref,$message, $address , $testemail, $flag , $smtp, $debug){
  
  try{

    $mail = $mailerObject;

    $mail->IsSMTP(); // enable SMTP
    $mail->IsHTML(true);
  
    $smtp_val = $smtp[0];
    $smtp_val= json_decode($smtp_val);

   
    
    // $mail->Host =     $smtp_val->{'HOSTNAME'}";

    $mail->Host =    $smtp_val->{'HOSTNAME'};
    $mail->Port =    $smtp_val->{'PORT'};
    
    $mail->Username = "";
    $mail->Password = "";

    $mail->SMTPAuth = false;
    $mail->SMTPAutoTLS = false;  
   
    $mail->SMTPSecure = 'none';

    if($debug == true) {

      $mail->SMTPDebug  = 2;
    }
    
  
    $mail->SetFrom($fromEmail,"Compras");
  
    $mail->Body = $message;
  
    if ($flag == 0) {
    
      $mail->Priority = 1;
      $mail->AddCustomHeader("X-MSMail-Priority: High");
      $mail->AddCustomHeader("Importance: High");
      $subject ='Pedido Urgente!. Requisicion-'.$ref;
      
    }else{
  
      $subject ='Requisicion-'.$ref.' '.$SubjectPay;
  
    }
  
    $mail->Subject = utf8_decode($subject);
  
   
   
    if($testemail != ''){
  
      $mail->AddAddress($testemail ,'test email');
    
    }else{
    
      foreach ($address as  $value) {
      
        $value = json_decode($value);
      
        $mail->AddAddress($value->{'email'}, $value->{'name'}.' '.$value->{'lastname'});
      
      }
    }
  
    if(!$mail->send()) {
    
    
      $alert .= 'Message could not be sent.';
      $alert .= 'Mailer Error: ' . $mail->ErrorInfo;
    
      //echo '<script> alert("'.$alert.'"); </script>';
    
    } else {
    
      return '1';
    
      // echo '<script> alert("Message has been sent"); </script>';
    }

  }catch (phpmailerException $e) {

  echo $e->errorMessage(); //Pretty error messages from PHPMailer

  } catch (Exception $e) {

  echo $e->getMessage(); //Boring error messages from anything else!

  }





}


function get_string_between($string, $start, $end){
    $string = ' ' . $string;
    $ini = strpos($string, $start);
    if ($ini == 0) return '';
    $ini += strlen($start);
    $len = strpos($string, $end, $ini) - $ini;
    return substr($string, $ini, $len);
}


?>

<!-- </div>
</div> -->

