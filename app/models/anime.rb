class Anime < ApplicationRecord
    belongs_to :user
    belongs_to :category   
    has_many :reviews, dependent: :destroy 
    has_many :users, through: :reviews 

    validates :name, presence: true  
    validates :character, uniqueness: true  
    validate :not_a_duplicate 

    scope :order_by_stars, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

    def self.alpha
        order(:name) 
    end

    def category_attributes=(attributes)
        self.category = Category.find_or_create_by(attributes) if !attributes['name'].empty?
        self.category 
    end

    def not_a_duplicate
        anime = Anime.find_by(name: name, character: character) 
        if  !!anime && anime != self
          errors.add(:name, 'has already been added for that character')
        end
    end 

    def category_name
        category.try(:name)
      end
    
      def name_and_category
        "#{name} - #{category.try(:name)}"
      end
end
