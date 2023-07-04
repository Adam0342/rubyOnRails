class Recipes < ActiveRecord::Migration[7.0]
    def change
        has_many :user_recipes, foreign_key: 'recipe_id'
        
        create_table :recipes do |table|
            table.string :name 
            table.string :ingredients
            table.string :steps
            table.string :allergens
            table.string :info
        end
    end
end
