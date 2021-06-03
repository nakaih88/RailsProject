class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in 
    
    def new
        if @anime = Anime.find_by_id(params[:anime_id])
          @review = @anime.reviews.build
        else
          @review = Review.new
        end
      end

      def create
        @review = current_user.reviews.build(review_params)
        if @review.save
          redirect_to review_path(@review)
        else
          render :new
        end
      end

    def show
        @review = Review.find_by_id(params[:id])
    end
    
    def index
      #binding.pry
    if @anime = Anime.find_by_id(params[:anime_id])
          @reviews = @anime.reviews
          
        else
          #binding.pry
          @reviews = Review.all
        end
      end

    private 

    def review_params
        params.require(:review).permit(:anime_id, :content, :stars, :title)  
    end 
end
