module RecipeHelper
    def total_ingredient
        user_recipes = get_user_recipes(session[:user_id])[:recipe_id]
        total_list = {}
        get_hash(user_recipes).each do |recipe, recipe_amount|
            ingredient = Recipe.find_by(name: recipe)[:ingredients]
            eval(ingredient).each do |ingredient_name, ingredient_amount|
                ingredient_total = ingredient_amount * recipe_amount
                if total_list.include? ingredient_name 
                    total_list[ingredient_name] += ingredient_total.to_i
                else
                    total_list.merge!(ingredient_name => ingredient_total.to_i)
                end
            end
        end
        return total_list
    end

    def recipe_params
        params.permit(:name.to_s, :ingredients.to_s, :steps.to_s, :allergens.to_s, :info.to_s)
    end

    def get_user_recipes(id)
        return UserRecipe.find_by(user_id: id)
    end

    def get_hash(data)
        begin
            return JSON.parse(data)
        rescue
            if data == nil
                return {}
            end
        end
    end

    def append_hash(user_recipes)
        recipe = params[:add].present? ? Recipe.find_by(id: params[:add]) : Recipe.find_by(id: params[:remove])
        begin
            params[:add].present? ? user_recipes[recipe[:name]] += 1 : user_recipes[recipe[:name]] -= 1
            if user_recipes[recipe[:name]] <= 0
                user_recipes.delete(recipe[:name])
                puts "IN IF HERE"
            end
        rescue
            puts "IN RESCUE HERE"
            user_recipes.merge!((recipe[:name])=> 1)
        end
        return user_recipes
    end

    def store_hash(location, data)
        json_hash = JSON.generate(data)
        location.update(recipe_id: json_hash)
        location.save
    end
end
