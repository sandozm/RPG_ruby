class CreateCurrentQuests < ActiveRecord::Migration
  def change
    create_table :current_quests do |t|
    	t.integer :character, default: 0
    	t.integer :quest, default: 0
    	t.integer :stat, default: 0
      t.timestamps null: false
    end
  end
end
