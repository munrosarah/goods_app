class Thumbnailremoval < ActiveRecord::Migration
  def up
    remove_column :products, :thumbnail
  end

  def down
  end
end
