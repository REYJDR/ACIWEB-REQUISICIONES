<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

    <div class=" col-lg-6">
    <fieldset>
        
        
        <legend><h4>Adjuntar soporte</h4></legend>
        <input class=" col-lg-12" accept='.gif,.jpg,.jpeg,.png,.doc,.docx,.pdf' type="file" name="fileToUpload[]" id="fileToUpload" multiple/>
        <button onclick="uploadFiles('test');" >upload</button>
    </fieldset>
    </div> 
    <div class=" col-lg-12">
    <fieldset>
    <lable id='msg'></label>
    </fieldset>
    </div> 



</body>
</html>

<script>
//**************************************************** */
function uploadFiles(req){
    $('#msg').html('');
	URL = document.getElementById('URL').value;

		var link= URL+"public/soportes/upload.php";
		var fileInput = document.getElementById('fileToUpload');

        


        var formData = new FormData();
        
        var files = fileInput.files;

        for(var file in files) {
         formData.append("fileToUpload", files[file].data);
        }



        formData.append('req', req);

		var xhr = new XMLHttpRequest();

		xhr.open('POST', link, true);
		xhr.send(formData);

		xhr.onload = function () {
		if (xhr.readyState === xhr.DONE) {
			if (xhr.status === 200) {
                $('#msg').html(xhr.response);
			}
		}
	};

}
//**************************************************** */
</script>