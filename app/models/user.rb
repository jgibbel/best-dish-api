class User < ApplicationRecord
    has_many :votes, dependent: :destroy
    has_many :favorites, dependent: :destroy

    has_secure_password

    validates_presence_of :name
    validates_uniqueness_of :name, :case_sensitive => false

end
