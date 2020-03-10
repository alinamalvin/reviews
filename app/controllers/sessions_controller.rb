class SessionsController < ApplicationController

def new
end 

def create
    # authenticate the user - verify  they exist in the db by username
    # and that thir password matches what is in nthe db
    @user= User.find_by(username: params[:username])
    if !@user
        @error = "Account not found. Please try again." 
        render :new
    elsif !@user && @user.authenticate(params[:password])
        @error = "Password Incorrect. Please try again"
        render :new 
    else 
    # if it does, "log them in" with the session hash
    # and redirect them to a meaningful place
    log_in(@user)
    redirect_to products_path 
    # otherwise, re render the login form, displaying a meaningful error
    end 
end

def destroy
    session.clear 
    redirect_to products_path
end 

end 
