class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.references :character, index: true
      t.references :item, index: true
      t.integer :equip

      t.timestamps null: false
    end
    add_foreign_key :inventory, :character
    add_foreign_key :inventory, :item
  end
end
