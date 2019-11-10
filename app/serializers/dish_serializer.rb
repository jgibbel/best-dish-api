class DishSerializer < ActiveModel::Serializer
    attributes :name, :restaurant_id, :votes_count
    has_many :votes 
  end