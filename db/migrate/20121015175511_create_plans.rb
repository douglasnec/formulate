class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.text :descryption
      t.float :value

      t.timestamps
    end
  end
end
