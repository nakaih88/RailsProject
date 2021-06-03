class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in
  
     def home 
     end
  
     def new  
        @user = User.new
     end 
  
    def create
          @user = User.find_by(username: params[:user][:username])
      
          if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
          else
            flash[:errors] = ["Incorrect Username and or Password, please try again."]
            redirect_to login_path notice: "Invalid Input!"
          end
    end
  
    def google_omniauth_create
      @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
        user.username = auth["info"]["first_name"]
        user.password = SecureRandom.hex(10)
      end
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to '/'
      end
    end
  
    def destroy 
        session.clear  
        redirect_to '/'
    end 
    
      private
      
end