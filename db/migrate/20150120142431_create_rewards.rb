class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.references :quest, index: true
      t.references :item, index: true

      t.timestamps null: false
    end
    add_foreign_key :reward, :quest
    add_foreign_key :reward, :item
  end
end
