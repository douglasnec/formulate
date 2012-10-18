class Plan < ActiveRecord::Base
  has_many :accounts
  attr_accessible :descryption, :title, :value  
end
