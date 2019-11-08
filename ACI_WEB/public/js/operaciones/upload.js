
var fileList = [];
var renderFileList, sendFile;
var URL = document.getElementById('URL').value; 
var fileCatcher = document.getElementById('file-catcher');
var fileInput = document.getElementById('file-input');
var fileListDisplay = document.getElementById('file-list-display');
var button = document.getElementById('send');


(function () {
    
    $('#msg').html('');
      
    //   var fileList = [];
    //   var renderFileList, sendFile;
      
    //   button.addEventListener('click', function (evnt) {
    //       evnt.preventDefault();
    //     fileList.forEach(function (file) {
    //         sendFile(file);
    //     });
    //   });
      
      fileInput.addEventListener('change', function (evnt) {
         //	fileList = [];
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
          
          icon.setAttribute("class", "fas fa-minus");
          icon.setAttribute("style", "color:#FB9079");
          icon.setAttribute("onclick", "removeFile("+id+");");
    
          fileDisplayEl.innerHTML =  '&nbsp' + file.name ;
          
          
          div.appendChild(icon);
          div.appendChild(fileDisplayEl);

          fileListDisplay.appendChild(div);
    
        });
    
       
      };
    
      

    
    removeFile  = function(id){
        id = id - 1;
        fileList.splice(id, 1);
        for(var i = fileList.length - 1; i >= 0; i--) {
        if(fileList[i] === id) {
            fileList.splice(i, 1);
        }
    }
        renderFileList();
    
    };
    
})();
    
function uploadFiles(req){

    fileList.forEach(function (file) {
        sendFile(file,req);
    });

    
} 

function  sendFile (file,req) {

  var formData = new FormData();
  var request = new XMLHttpRequest();
  var link= URL+"public/soportes/upload.php";
  
  formData.set('file', file);
  formData.append('req', req);
  request.open("POST", link);
  request.send(formData);

  request.onload = function () {
      if (request.readyState === request.DONE) {
          if (request.status === 200) {
             console.log(request.response);
              $('#msg').html(request.response);
          }
      }
  }
}
    
function downloadFile($req,$file){

    var formData = new FormData();
    var request = new XMLHttpRequest();
    var link= URL+"public/soportes/download.php";
    
    formData.append('file', file);
    formData.append('req', req);

    request.open("POST", link);
    request.send(formData);
  
    request.onload = function () {
        if (request.readyState === request.DONE) {
            if (request.status === 200) {

                $('#msg').html(request.response);
            }
        }
    }


}