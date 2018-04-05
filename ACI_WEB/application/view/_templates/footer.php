<div id="footer" class="footer  col-xs-12">

<div    class="crop col-xs-6">
<?php
sleep(1);
    //GET LAST SYNC
    $date_db = $this->model->Query_value('PurOrdr_Header_Exp','LAST_CHANGE','order by LAST_CHANGE desc limit 1');	  

    $date = $this->model->GetLocalTime('MST',$date_db);
    $dbHour = strtotime($date);

    $Nowdate = $this->model->GetLocalTime(UTC,''); 
    $NowHour = strtotime($Nowdate);

    $dif = ($NowHour - $dbHour)/3600;

    echo '<i style="font-weight:bold; color:red; font-size:12; ">'.$dif.'</i>';

    if ($dif >= 2){

        echo '<i style="font-weight:bold; color:red; font-size:12; ">Informacion de OC no sincronizada desde hace 2h</i>';
        
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

<?php 

/*date_default_timezone_set('America/Panama');


$now = new DateTime();
$mins = $now->getOffset() / 60;

$sgn = ($mins < 0 ? -1 : 1);
$mins = abs($mins);
$hrs = floor($mins / 60);
$mins -= $hrs * 60;

$offset = sprintf('%+d:%02d', $hrs*$sgn, $mins);

echo $offset;*/


?>