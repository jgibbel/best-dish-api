class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :votes

  def votes_count 
    self.votes.size
  end 
  
end
