class SessionsController < ApplicationController

def new
end 

def create
    #binding.pry
    # if a user logged in with omniauth (how we can tell?)
    if request.env["omniauth.auth"] 
        # then find or create in the db by uid 
        @user=User.find_by(github_uid: request.env["omniauth.auth"])
        if @user.nil?
            @user=User.create(username: request.env["omniauth.auth"]["info"]["nickname"], github_uid: request.env["omniauth.auth"]["uid"], password: "github")       
        end 
        successful_login
    else 
        # locally authenticate the user - verify  they exist in the db by username
        # and that thir password matches what is in the db
        @user= User.find_by(username: params[:username])
        if !@user
             @error = "Account not found. Please try again." 
            render :new
        # otherwise, re render the login form, displaying a meaningful error
        elsif !@user && @user.authenticate(params[:password])
             @error = "Password Incorrect. Please try again"
             render :new 
        else 
        # if it does, "log them in" with the session hash
        # and redirect them to a meaningful place
        successful_login
    end 
 end 
end

def destroy
    session.clear 
    redirect_to products_path
end 

private 

def successful_login
    log_in(@user)
    redirect_to products_path
end 

end 