$(function(){
  $("#form-validate").validationEngine();
  
  $(".dropdown-menu").click(function(e) {
    e.stopPropagation();
  }); 
});
