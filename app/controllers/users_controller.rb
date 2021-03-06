class UsersController < ApplicationController
    #before_action execute in order..
    before_action :set_user, only: [:edit, :show, :update]
    before_action :require_same_user, only: [:edit,:update, :destroy]
    before_action :require_admin, only: [:destroy]
    
    
    def index
        @users = User.paginate(page: params[:page], per_page: 4)
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome the Alpha Club, #{@user.username}"
            redirect_to articles_path
        else
            render 'new'
        end
    end
    
    def edit
        #delete after implementing method: user_params
        #@user = User.find(params[:id])
    end
    
    def update
        #delete after implementing method: user_params
        #@user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Your account was succesfully updated"
            redirect_to articles_path
        else
            render 'edit'
        end
    end
    
    def show
        #delete after implementing method: user_params
        #@user = User.find(params[:id])
        @user_articles = @user.articles.paginate(page: params[:page], per_page: 4)
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:danger] = "User and all articles created by user have been deleted"
        redirect_to users_path
    end
    
    private
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end
    
    def set_user
        @user = User.find(params[:id])
    end
    
    def require_same_user
        if current_user != @user and !current_user.admin?
            flash[:danger] = "You can only edit your own profile"
            redirect_to root_path
        end
    end
    
    def require_admin
        if logged_in and !current_user.admin?
            flash[:danger] = "Only admin can delete users"
            redirect_to root_path
        end
    end
end