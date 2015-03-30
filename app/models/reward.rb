class Reward < ActiveRecord::Base
	
  belongs_to :quests
  belongs_to :items
end
