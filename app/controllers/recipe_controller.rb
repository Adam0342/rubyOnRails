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

    def complete_recipe
        puts "\n\n\n #{params} \n\n\n"
        recipe = Recipe.create(:name => params[:name].to_s, :ingredients => params[:ingredient].zip(params[:amount]).to_h.to_s, :steps => params[:step].to_s, :allergens => params[:allergens].to_s, :info => params[:info].to_s)

        if recipe.save
            puts "RECIPE CREATED"
        else
            puts "SOMETHING WENT WRONG"
        end
    end

    def add_ingredient
        render "recipe/_ingredient"
    end

    def add_steps
        render "recipe/_steps"
    end

    def personal_list_manage
        user_recipes = helpers.get_user_recipes(session[:user_id])
        recipe_hash = helpers.get_hash(user_recipes[:recipe_id])
        recipe_hash = helpers.append_hash(recipe_hash)
        helpers.store_hash(user_recipes, recipe_hash)
    end

end