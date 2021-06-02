class Anime < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    has_many :reviews, dependent: :destroy 
    has_many :users, through: :reviews 

    validates :name, presence: true  
    validates :main_character, uniqueness: true  
    validate :not_a_duplicate 

    scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

    def self.alpha
        order(:name) 
    end

    def category_attributes=(attributes)
        self.category = Genre.find_or_create_by(attributes) if !attributes['name'].empty?
        self.category 
    end

    def not_a_duplicate
        anime = Anime.find_by(name: name, main_character: main_character) 
        if  !!anime && anime != self
          errors.add(:name, 'Has already been added for that Character')
        end
    end 

    def genre_name
        genre.try(:name)
      end
    
      def name_and_genre
        "#{name} - #{genre.try(:name)}"
      end
end
