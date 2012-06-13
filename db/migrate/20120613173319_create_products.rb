class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :type
      t.float :price
      t.string :desc
      t.string :image
      t.string :thumbnail

      t.timestamps
    end
  end
end
