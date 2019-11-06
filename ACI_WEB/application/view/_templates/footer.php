<div id="footer" class="footer  col-xs-12">

<div    class="crop col-xs-6">
<?php

    //GET LAST SYNC
    if($date_db==''){

        $date_db = $this->model->Query_value('CompanyLogSync','LastSync',' limit 1 ');	  
        /*$date = $this->model->GetLocalTime('MST',$date_db);*/
        $dbHour = strtotime($date_db);
    }else{
        $dbHour =  $date;

    }

    $Nowdate = $this->model->GetLocalTime(UTC,''); 
    $NowHour = strtotime($Nowdate);

   $dif = ($NowHour - $dbHour)/3600;

    
    if ($dif >= 4){

        echo '<i style="font-weight:bold; color:red; font-size:12; ">Informacion de OC no sincronizada desde hace 4h</i>';
        
    }
?>
</div> 


<div style="float: right; text-align:right;" class="crop col-xs-6">
<img width="15px" src="img/Database.png" /><?php  echo $this->model->TestConexion(); ?>

</div>


</div>

</div>

</body>
</html>
<!-- UPLOAA FILES -->
<script src="<?php echo URL; ?>js/operaciones/upload.js"></script>
