class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :quest, index: true
      t.string :questions

      t.timestamps null: false
    end
    add_foreign_key :question, :quest
  end
end
