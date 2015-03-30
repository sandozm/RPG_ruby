class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :pv, default: 0
      t.integer :atk, default: 0
      t.integer :def, default: 0
      t.integer :slot, default: 1

      t.timestamps null: false
    end
  end
end
