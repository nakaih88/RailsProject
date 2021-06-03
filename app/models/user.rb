class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_animes, through: :reviews, source: :anime #Sometimes, you want to use different names for different associations. If the name you want to use for an association on the model isn't the same as the assocation on the :through model, you can use :source to specify it.

    has_many :animes

    has_secure_password 

    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true 

  
end
