class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name
      t.text :descryption
      t.string :align_label
      t.text :confirmations
      t.integer :account_id

      t.timestamps
    end
  end
end
