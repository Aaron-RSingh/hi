class UsersController < ApplicationController
    before_action :user_id, only: [:show]
    
    def show 
    end 
    
    def home
        render :home
    end

    def new 
        @user = User.new 
    end 

    def create
     @user = User.create(user_params)
     session[:user_id] = @user.id
     redirect_to user_path(@user)
    #add a redirect path
    end 

    private 

   def user_params 
    params.require(:user).permit(:first_name, :last_name, :email, :password, :tagline, :age, :bio, :picture)
   end 

   def user_id 
    @user = User.find(params[:id])
   end 

end
