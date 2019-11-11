class UserSerializer < ActiveModel::Serializer
    attributes :name, :id
    has_many :favorites
  end