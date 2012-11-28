module FormsHelper
  # formata o label dos campos text
  def label_field(field)
    if field.label?
      html = field.label     
    else
      html = "Campo sem label"
    end
    
    if field.value_unique == '1'
      html += "<spam id='tit"+field.id.to_s+"' class='font-red'> * </spam>"
      html.html_safe
    else
      html
    end
  end
  
  # largura do campo  
  def lenght_input(field)
    
    case field.lenght
    when 0
      'small'
    when 1
      'medium'
    when 2 
      'large'
    else
      'large'
    end
  end
  def rows_of_textarea
    case @field.lenght
    when 0
      '3'
    when 1
      '6'
    when 2 
      '9'
    else
      '6'
    end
  end
  
  def verificaRequired
    if @field.value_unique == '1'
      true
    else
      false
    end
  end
  
  
  def verificaShow(valor)
    if @field.view.to_s == valor.to_s
      true
    else
      false
    end
  end    
  
  def verifyTypeFormated
    typeText = ["1","3"] #  do tipo texto 1-text; 3-textarea
    if @field.descryption.in?(typeText)
      [['Characters', 1 ],  ['Words', 2]]
    else 
      [['Value', 3], ['Digits', 4]]
    end   
  end
  
  def showField(field)
    if field.view == 2
      "<div id='icon" + field.id.to_s + "'><i class='icon-eye-close' class='viewer'></i></div>".html_safe
    end
  end
end
