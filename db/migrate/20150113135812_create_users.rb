class CreateUsers < ActiveRecord::Migration
  def change

    create_table :users do |t|
          t.string :username, :null => false
          t.string :email, :null => false
          t.string :password, :null => false
          t.string :salt, :null => false
          t.integer :role, :null => false, :default => 0
          t.timestamps
    end
  end
end
