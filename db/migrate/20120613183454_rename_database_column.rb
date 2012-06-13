class RenameDatabaseColumn < ActiveRecord::Migration
  def up
    rename_column :products, :type, :variety
  end

  def down
    rename_column :products, :variety, :type
  end
end
