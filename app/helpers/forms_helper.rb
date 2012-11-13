module FormsHelper
  # formata o label dos campos text
  def label_field(field)
    if field.descryption
      field.descryption
    else
      "Campo sem label:"
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
    
end
