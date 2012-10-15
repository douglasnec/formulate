class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :descryption

      t.timestamps
    end
  end
end
