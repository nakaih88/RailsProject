class AnimesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_anime, only: [:show, :edit, :update] 

    def new 
        @anime = Anime.new  
        @anime.build_category 
    end 

    def create
        @anime = Anime.new(anime_params) 
        @anime.user_id = session[:user_id] 
   
       if @anime.save 
         redirect_to anime_path(@anime) 
       else
        @anime.build_category  
         render :new 
       end
     end

    def index   
      if params[:category_id]
        category = Category.find(params[:category_id])
        @animes = category.animes 
      
      else 
        @animes = Anime.order_by_stars.includes(:category) 
      end 
    end 

    def show 
    end 

    def edit 
      if authorized_to_edit?(@anime) 
       render :edit   
      else 
       redirect_to anime_path(@anime)   
      end
     end 

    def update   
      if @anime.update(anime_params)
        redirect_to anime_path(@anime)
      else
        render :edit
      end 
    end 
    
    def destroy
      @anime= Anime.find(params[:id])
      @anime.destroy
      redirect_to anime_path(@anime)
     end

    private 

    def anime_params
        params.require(:anime).permit(:name, :episode_length, :character, :category_id, category_attributes: [:name])
      end

    def set_anime
        @anime = Anime.find_by(id: params[:id])
        redirect_to animes_path if !@anime 
     end

     def redirect_if_not_authorized 
      if @anime.update(name: params[:name], episode_length: params[:episode_length], character: params[:character])   
        redirect_to anime_path(@anime)
      else
        redirect_to user_path(current_user)     
      end 
    end

end
