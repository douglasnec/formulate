class Field < ActiveRecord::Base
  attr_accessible :choice_id, :descryption, :form_id, :formated, :instruction, :lenght, :max, :min, :predefined, :value_unique, :view
end
