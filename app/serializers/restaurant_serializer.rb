class RestaurantSerializer < ActiveModel::Serializer
    attributes :id, :name, :image, :address, :longitude, :latitude, :category, :borough
    has_many :dishes
end