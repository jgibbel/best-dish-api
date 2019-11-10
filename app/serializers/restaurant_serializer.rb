class RestaurantSerializer < ActiveModel::Serializer
    attributes :name, :image, :address, :longitude, :latitude, :category, :borough
    has_many :dishes
end