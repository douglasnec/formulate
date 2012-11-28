$(document).ready(function(){
  $('a[href="#addfield"]').tab('show') 
});
/* Muda a Label quando o usuário digitar algo no campo label do field */
function changeLabel(){
	var field_id = $('#field_id').val()
	$('#title'+field_id).html($('#field_label').val())
}
/* Muda a Instrução que deverá ser passada para o usuário */
function changeInstruction(){
	var field_id = $('#field_id').val()
	$('#instruction'+field_id).html($('#field_instruction').val())	
}
/* Altera o tamanho dos campos */
function changeFieldSize(){
	var field_id = $('#field_id').val()
	var value = $('#field_lenght').find('option').filter(':selected').val()
	$('#Field'+field_id).removeClass('small medium large');
	if(value == 0)
		$('#Field'+field_id).addClass('small');
	else if(value == 1)
		$('#Field'+field_id).addClass('medium');
	else
		$('#Field'+field_id).addClass('large');
}
/* Adiciona ou remove o caracter "*" para identificar o REQUIRED */
function addremRequired(){
	var field_id = $('#field_id').val()
	var field = $("#title"+field_id).html() 
	if(field.indexOf('*') > 0){
		$("#tit"+field_id).remove()
	}else{
		$("#title"+field_id).html(field+" <spam id='tit"+field_id+"' class='font-red'> * </spam>")
		
	}	
}

/* Adiciona ou remove o icone de um olho para qualquer usuário visualizar */
function showField(type){
	var field_id = $('#field_id').val()
	var div = "<div id='icon"+field_id+"'><i class='icon-eye-close' class='viewer'></i></div>";	
	if(type == 2) /* 1 - everyone; 2 - Admin Only */
		$("#foli"+field_id).append(div)
	else
		$("#icon"+field_id).remove()
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

function salvarField(){
	var field_id = $('#field_id').val()
	// tratando checked Required
	var unique = 0;
	if($('#field_value_unique').attr('checked') == "checked")
		unique = 1;
		
	// tratando radio 'show field to'
	var view = 1
	if($('#field_view_2').attr('checked') == "checked")
		view = 2
	
	$.post('/forms/update_field',
	{ 
	 	'id': field_id,
	 	'form_id': $('#field_form_id').val(),
		'label': $('#field_label').val(),
		'descryption': $('#field_descryption').val(),
		'min': $('#field_min').val(),
		'max': $('#field_max').val(),
		'predefined': $('#field_predefined').val(),
		'instruction': $('#field_instruction').val(),
		'value_unique': unique,
		'view': view,
		'formated': $('#field_formated').val(),
		'lenght': $('#field_lenght').val() 
	},
	function(retorno){
				
	},
	'html'			
);
}

/*
$("form").submit(function(){
	return code
})
*/
