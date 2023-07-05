class UsersController < ApplicationController
    #protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token

    def allergens
        user = UserRecipe.find_by(user_id: session[:user_id])
        user.update(user_allergens: params[:allergies].drop(1))
        user.save
    end

    def create_session
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: 'Logged in successfully.'
        else
            flash.now[:alert] = 'Invalid username or password.'
            render :login
        end
    end

    def destroy_session
        session[:user_id] = nil
        redirect_to root_path, notice: 'Logged out successfully.'
    end

    def create_user
        if user_params[:password] == user_params[:password_confirmation]
            user = User.new(user_params)
            if user.save
                puts "USER CREATED"
                session[:user_id] = user.id
                UserRecipe.new(:user_id => user.id).save
                redirect_to root_path
            else
                puts "SOMETHING WENT WRONG"
                flash.now[:alert] = 'Something went wrong.'
                render :register
            end
        else
            puts "NO PASSWORD MATCH"
            flash.now[:alert] = 'Passwords do not match.'
            render :register
        end
    end

    private

    def user_params
        params.permit(:email, :username, :password, :password_confirmation)
    end
end
