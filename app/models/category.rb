class Category < ApplicationRecord
    has_many :animes 

    validates :name, presence: true, uniqueness: true  

    scope :alpha, -> {order(:name)} 
end
