require 'json'

class RecipeController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create_console
        recipe = Recipe.new(helpers.recipe_params)
        if recipe.save
            puts "RECIPE CREATED"
        else
            puts "SOMETHING WENT WRONG"
        end
    end

    def create_web
        puts "\n\n\n #{params} \n\n\n"
    end

    def add_ingredient
        render "recipe/ingredient"
    end

    def personal_list_manage
        user_recipes = helpers.get_user_recipes(session[:user_id])
        recipe_hash = helpers.get_hash(user_recipes[:recipe_id])
        recipe_hash = helpers.append_hash(recipe_hash)
        helpers.store_hash(user_recipes, recipe_hash)
    end

end