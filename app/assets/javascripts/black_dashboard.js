
//= require black_dashboard/black-dashboard
//= require black_dashboard/demo


function validateImage(inputFile) {

  var maxExceededMessage = "This file exceeds the maximum allowed file size (15 MB) <br>";
  var extErrorMessage = "To upload a video please use the video uploader. Only .jpg, .jpeg, .gif or .png are allowed in the photo section";
  var allowedExtension = ["jpg", "jpeg", "gif", "png", 'JPG', 'JPEG', "GIF", "PNG"];

  var extName;
  var maxFileSize = $(inputFile).data('max-file-size');
  var sizeExceeded = false;
  var extError = false;
  var message = '';

  $.each(inputFile.files, function() {
    if (this.size && maxFileSize && this.size > parseInt(maxFileSize)) {sizeExceeded=true;};
    extName = this.name.split('.').pop();
    if ($.inArray(extName, allowedExtension) == -1) {extError=true;};
  });

  if (sizeExceeded) {
    // $('.modal-body').html( maxExceededMessage);
    // $('#photoModal').modal('toggle');
     message += maxExceededMessage;
    $(inputFile).val('');
  };

  if (extError) {
    // $('.modal-body').html( extErrorMessage);
    // $('#photoModal').modal('toggle');
    message += extErrorMessage;
    $(inputFile).val('');
  };
  if(extError || sizeExceeded){
    $('.modal-body-image').html( message);
    $('#photoModal').modal('toggle');
  };
};

function validateVideo(inputFile) {
  var maxExceededMessage = "This file exceeds the maximum allowed file size (50 MB) <br>";
  var extErrorMessage = "To upload a video please use the video uploader. Only .mp4, .m4v, .avi or .mov are allowed in the video section";
  var allowedExtension = ["mp4", "m4v", "avi", "mov", "MP4", "M4V", "AVI", "MOV"];

  var extName;
  var maxFileSize = $(inputFile).data('max-file-size');
  var sizeExceeded = false;
  var extError = false;
  var message = '';
  $.each(inputFile.files, function() {
    if (this.size && maxFileSize && this.size > parseInt(maxFileSize)) {sizeExceeded=true;};
    extName = this.name.split('.').pop();
    if ($.inArray(extName, allowedExtension) == -1) {extError=true;};
  });
  if (sizeExceeded) {
    message += maxExceededMessage;
    // $('.modal-body').html( maxExceededMessage);
    // $('#videoModal').modal('toggle');
    /*window.alert(maxExceededMessage); */
    $(inputFile).val('');
  };

  if (extError) {
    message += extErrorMessage;
    // $('.modal-body').html( extErrorMessage);
    // $('#videoModal').modal('toggle');
    $(inputFile).val('');
  };

  if(extError || sizeExceeded){
    $('.modal-body-video').html( message);
    $('#videoModal').modal('toggle');
  };
};
