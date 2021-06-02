class GenresController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index 
        @genres = Genre.alpha 
    end 
end
