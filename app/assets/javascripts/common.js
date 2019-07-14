$(function(){
  $("#form-validate").validationEngine();
  
  $(".dropdown-menu").click(function(e) {
    e.stopPropagation();
  }); 

  // action cable 
  var obj = document.getElementById('scroll');
  obj.scrollTop = obj.scrollHeight;
});
