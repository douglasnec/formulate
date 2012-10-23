$(document).ready(function(){
  $("#addinput").click(function(){    
	$("#fields").append("<div class='text-field class-group'><label class='control-label' for='inputLabel'>Label: </label><div class='controls'><input type='text' id='inputLabel'></div></div>");	
  });
})