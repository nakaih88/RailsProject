class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_animes, through: :reviews, source: :anime

    has_many :animes

    has_secure_password 

    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true 
end
