class Character < ActiveRecord::Base
  belongs_to :users
  has_and_belongs_to_many :items, join_table: "inventories"

  validates :name, :presence   => true,
    :uniqueness => true
end
