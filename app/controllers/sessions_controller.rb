class SessionsController < ApplicationController
    def new
    end
    
    #start session
    def create
        #render 'new'
        #debugger
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Success Login"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "Not a valid username and password combination"
            render 'new'
        end
    end
    
    #logout. Stop the session
    def destroy
        session[:user_id] = nil
        flash[:warning] = "You are successfully logout"
        redirect_to root_path
    end
    
end