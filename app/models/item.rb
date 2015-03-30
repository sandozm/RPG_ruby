class Item < ActiveRecord::Base
	has_and_belongs_to_many :characters, join_table: "inventories"
	has_and_belongs_to_many :quests, join_table: "rewards"
end
