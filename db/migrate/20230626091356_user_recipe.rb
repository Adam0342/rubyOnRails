class UserRecipe < ActiveRecord::Migration[7.0]
    def change
        create_table :user_recipes do |table|
            table.string :user_id 
            table.string :recipe_id
            table.string :ingredients
            table.string :user_allergens
        end
    end
end
