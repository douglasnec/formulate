$(document).ready(function(){
  $('a[href="#addfield"]').tab('show') 
});

function changeLabel(){
	var field_id = $('#field_id').val()
	$('#title'+field_id).html($('#field_label').val())
}
function changeDescription(){
	var field_id = $('#field_id').val()
	$('#instruction'+field_id).html($('#field_descryption').val())	
}
function changeFieldSize(){
	var field_id = $('#field_id').val()
	var value = $('#field_lenght').find('option').filter(':selected').val()
	$('#Field'+field_id).removeClass('small');
	$('#Field'+field_id).removeClass('medium');
	$('#Field'+field_id).removeClass('large');
	if(value == 0)
		$('#Field'+field_id).addClass('small');
	else if(value == 1)
		$('#Field'+field_id).addClass('medium');
	else
		$('#Field'+field_id).addClass('large');
}

function editting(obj, id, form_id){
	var i=0;
	$('div').find('.page-indicator').each(function(){
		$(this).removeClass('page-indicator');
	});	
	// removendo classes focused existentes
	$('#'+obj.id).addClass('page-indicator')
	
	$('a[href="#setfield"]').tab('show');
	$.post('/forms/getfield',
		{ 
			'id': id,
		    'form_id': form_id 
		},
		function(retorno){
			$('#setfield').html(retorno)			
		},
		'html'			
	);
}