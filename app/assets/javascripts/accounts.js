function select_avatar(id){
   var before_id = $('#account_avatar_id').val()
   $('#avatar_'+before_id).removeClass('red-border')
   $('#avatar_'+id).addClass('red-border')
   $('#account_avatar_id').val(id)   
}

$(document).ready(function(){
  $("#account_name").keyup(function(){    
    $('#span_name').html($('#account_name').val())
  });
})