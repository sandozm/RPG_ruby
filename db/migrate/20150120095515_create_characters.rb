class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.references :user, index: true
      t.string :name
      t.integer :level, default: 1
      t.integer :pv, default: 0
      t.integer :atk, default: 0
      t.integer :def, default: 0
      t.integer :exp, default: 0
      t.integer :skill, default: 0

      t.timestamps null: false
    end
    add_foreign_key :character, :user
  end
end
