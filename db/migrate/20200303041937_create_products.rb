class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :title
      t.string :category
      t.string :img
      t.timestamps
    end
  end
end
