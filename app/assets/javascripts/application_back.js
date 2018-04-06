//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require cocoon
//= require back/plugins/bootstrap/bootstrap.min
//= require back/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min
//= require back/plugins/datatables/jquery.dataTables.min
//= require back/plugins/datatables/dataTables.bootstrap.min
//= require back/plugins/jvectormap/jquery-jvectormap-1.2.2.min
//= require back/plugins/jvectormap/jquery-jvectormap-usa-en
//= require back/plugins/jvectormap/jquery-jvectormap-world-mill-en
//= require 'icheck'
//= require back/app
//= require bootstrap-toggle

$(document).ready(function() {
  $('.datepicker').datepicker({
    dateFormat: 'dd-mm-yy'
 });

  $('.select2').select2();

  var table = $('.dataTable').DataTable();

  function icheck(){
  if($(".icheck-me").length > 0){
    $(".icheck-me").each(function(){
      var $el = $(this);
      var skin = ($el.attr('data-skin') !== undefined) ? "_" + $el.attr('data-skin') : "",
      color = ($el.attr('data-color') !== undefined) ? "-" + $el.attr('data-color') : "";
      var opt = {
        checkboxClass: 'icheckbox' + skin + color,
        radioClass: 'iradio' + skin + color,
      }
      $el.iCheck(opt);
    });
  }
}

$(function(){
  icheck();
})


  // Get sidebar state from localStorage and add the proper class to body
  $('body').addClass(localStorage.getItem('sidebar-state'));

  var activePage = stripTrailingSlash(window.location.pathname);
  $('.sidebar-menu li a').each(function(){
    var currentPage = stripTrailingSlash($(this).attr('href'));
    if (activePage == currentPage) {
      $(this).closest('.treeview').addClass('active');
      $(this).parent().addClass('active');
    }
  });
  function stripTrailingSlash(str) {
    if(str.substr(-1) == '/') { return str.substr(0, str.length - 1); }
    return str;
  }

  // Save sidebar state in localStorage browser
  $('.sidebar-toggle').on('click', function(){
    if($('body').attr('class').indexOf('sidebar-collapse') != -1) {
      localStorage.setItem('sidebar-state', '');
    } else {
      localStorage.setItem('sidebar-state', 'sidebar-collapse');
    }
  });
});

function validateImage(inputFile) {
  var maxExceededMessage = "This file exceeds the maximum allowed file size (15 MB) <br>";
  var extErrorMessage = "To upload a video please use the video uploader. Only .jpg, .jpeg, .gif or .png are allowed in the photo section";
  var allowedExtension = ["jpg", "jpeg", "gif", "png"];

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
    $('.modal-body').html( message);
    $('#videoModal').modal('toggle');
  };
};

function validateVideo(inputFile) {
  var maxExceededMessage = "This file exceeds the maximum allowed file size (50 MB) <br>";
  var extErrorMessage = "To upload a video please use the video uploader. Only .mp4, .m4v, .avi or .mov are allowed in the video section";
  var allowedExtension = ["mp4", "m4v", "avi", "mov"];

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
    $('.modal-body').html( message);
    $('#videoModal').modal('toggle');
  };
};

