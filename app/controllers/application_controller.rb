class ApplicationController < ActionController::Base
  # protect_from_forger :except => :sessions
  before_filter :authenticate_user!
  
  def after_sign_in_path_for(resource)
    
    # se for o primeiro login acabou de criar
     
    if current_user.sign_in_count == 1
      # criando account
      @account = Account.new("name" => first_name_for_account, "avatar_id" => 1, "plan_id" => 5)
      # salvando
      @account.save
      @user = User.find(current_user.id)
      @user.account_id = @account.id
      @user.save
    end
    
    home_path   
  end  
  
   
  def first_name_for_account
    my_string = current_user.email
    substring = my_string[/[^@]+/]
    substring
  end  
end
