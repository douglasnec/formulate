class Form < ActiveRecord::Base
  attr_accessible :account_id, :align_label, :confirmations, :descryption, :name
  
  has_many :fields
  accepts_nested_attributes_for :fields
end
