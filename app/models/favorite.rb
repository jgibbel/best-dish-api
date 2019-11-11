class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  def restaurantObj
    self.restaurant
  end
end
