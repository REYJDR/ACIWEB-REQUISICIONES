<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div class=" col-lg-12" id='file-catcher' >

    <div class=" col-lg-6">
        <fieldset> 
            <legend><h4>Adjuntar soporte</h4></legend>
            <input class=" col-lg-12" accept='.gif,.jpg,.jpeg,.png,.doc,.docx,.pdf' type="file" name="file-input" id="file-input" multiple/>
            <button id='send' onclick='uploadFiles("test2")' >upload</button>

        </fieldset>
    </div> 

    <div class=" col-lg-12">
      <div id='file-list-display'></div>
    </div>
    
    <!-- <div class=" col-lg-12">
        <fieldset>
           <lable id='msg'></label>
        </fieldset>
    </div>  -->
</div> 


</body>
</html>
