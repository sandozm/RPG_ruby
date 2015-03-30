class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :question, index: true
      t.string :reply
      t.integer :bool

      t.timestamps null: false
    end
    add_foreign_key :reply, :question
  end
end
