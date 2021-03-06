class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :anime

    validates :title, presence: true  
    validates :title, length: {maximum: 25}
    validates :content, length: {maximum: 250} 
    validates :stars, numericality: {only_integer: true, in: 1...5}
    
    validates :anime, uniqueness: { scope: :user, message: "has already been reviewed by yourself"}
end
