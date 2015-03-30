class Question < ActiveRecord::Base
  belongs_to :quests
  has_many :reply
end
