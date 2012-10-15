class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.integer :form_id
      t.text :descryption
      t.integer :choice_id
      t.integer :lenght
      t.string :value_unique
      t.integer :view
      t.integer :min
      t.integer :max
      t.integer :formated
      t.string :predefined
      t.text :instruction

      t.timestamps
    end
  end
end
