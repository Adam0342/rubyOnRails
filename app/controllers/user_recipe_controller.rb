class UserRecipe < ApplicationController
    def create_user
        user = User.new(user_params)
        if user.save
            puts "USER CREATED"
            session[:user_id] = user.id
            redirect_to root_path
        else
            puts "SOMETHING WENT WRONG"
            flash.now[:alert] = 'Something went wrong.'
            render :register
        end
end
