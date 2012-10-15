class Account < ActiveRecord::Base
  has_many :users
  accepts_nested_attributes_for :users, :allow_destroy => true
  attr_accessible :name, :avatar_id, :plan_id, :users_attributes  
  validates_presence_of :name
  
  
end
