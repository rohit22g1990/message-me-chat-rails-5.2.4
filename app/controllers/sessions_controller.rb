class SessionsController < ApplicationController
    before_action :user_logged_in, only: [:new, :create]
    def new
    end

    def create
        @user = User.find_by_username(params[:session][:username])
       
        if !@user.nil? and @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            flash[:success] = "Logged in successfully"
            redirect_to root_path
        else
            flash.now[:alert] = "Incorrect Credentials"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil;
        flash[:notice] = "Logged out successfully"
        redirect_to root_path
    end

    private

    def user_logged_in
        if logged_in?
            flash[:error] = "User already logged in"
            redirect_to root_path
        end
    end
end 