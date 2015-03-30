class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.references :npc, index: true
      t.string :name
      t.integer :next, default: 0

      t.timestamps null: false
    end
    add_foreign_key :quest, :npc
  end
end
