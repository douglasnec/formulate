class AddLabelToField < ActiveRecord::Migration
  def change
    add_column :fields, :label, :string
  end
end
