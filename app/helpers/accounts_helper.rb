module AccountsHelper
  def verify_selected(a)
    if a.id == @account.avatar_id
      'red-border cian'
    else
      'cian'
    end
  end
end
