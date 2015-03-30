class CreateNpcs < ActiveRecord::Migration
  def change
    create_table :npcs do |t|
      t.string :name
      t.integer :level, default: 1
      t.integer :pv, default: 0
      t.integer :atk, default: 0
      t.integer :def, default: 0

      t.timestamps null: false
    end
  end
end
