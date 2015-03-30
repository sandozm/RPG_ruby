class Quest < ActiveRecord::Base
  belongs_to :npc
  has_and_belongs_to_many :rewards, join_table: "rewards"
  has_many :questions
  has_many :rewards
end
