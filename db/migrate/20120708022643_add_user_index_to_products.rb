class AddUserIndexToProducts < ActiveRecord::Migration
  def change
    add_column :products, :user_id, :interger
    add_index :products, [:user_id]
  end
end
