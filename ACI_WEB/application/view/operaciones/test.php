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
            <button id='send' type='submit' >upload</button>

        </fieldset>
    </div> 

    <div class=" col-lg-12">
      <div id='file-list-display'></div>
    </div>
    
    <div class=" col-lg-12">
        <fieldset>
           <lable id='msg'></label>
        </fieldset>
    </div> 
</div> 



</body>
</html>

<script>


(function () {

  $('#msg').html('');
  
  var URL = document.getElementById('URL').value; 
  var fileCatcher = document.getElementById('file-catcher');
  var fileInput = document.getElementById('file-input');
  var fileListDisplay = document.getElementById('file-list-display');
  var button = document.getElementById('send');
  
  var fileList = [];
  var renderFileList, sendFile;
  
  button.addEventListener('click', function (evnt) {
  	evnt.preventDefault();
    fileList.forEach(function (file) {
    	sendFile(file);
    });
  });
  
  fileInput.addEventListener('change', function (evnt) {
 		fileList = [];
  	for (var i = 0; i < fileInput.files.length; i++) {

        fileList.push(fileInput.files[i]);
        
    }
    renderFileList();
  });
  
  renderFileList = function () {

  	fileListDisplay.innerHTML = '';
    fileList.forEach(function (file, index) {
      var id = index + 1;

      var div = document.createElement('div');
      var fileDisplayEl = document.createElement('label');
      var icon = document.createElement('i');
      
      icon.setAttribute("class", "fas fa-trash-alt");
      icon.setAttribute("style", "color:red");
      icon.setAttribute("onclick", "removeFile("+id+");");
      icon.innerHTML = "rm";

      fileDisplayEl.innerHTML = id + ' : ' + file.name ;
      
      div.appendChild(fileDisplayEl);
      div.appendChild(icon);
      
      fileListDisplay.appendChild(div);

    });
  };
  
  sendFile = function (file) {
  	var formData = new FormData();
    var request = new XMLHttpRequest();
    var link= URL+"public/soportes/upload.php";
    formData.set('file', file);
    formData.append('req', 'test');
    request.open("POST", link);
    request.send(formData);

    request.onload = function () {
		if (request.readyState === request.DONE) {
			if (request.status === 200) {
                $('#msg').html(request.response);
			}
        }
    }
  };

removeFile  = function () (id){

    fileList.splice(id, 1);

    renderFileList();

}


})();



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
