class Recipe < ApplicationRecord
    has_many :user_recipes, foreign_key: 'recipe_id'
    
    validates :name, presence: true, uniqueness: true
    validates :ingredients, presence: true
    validates :steps, presence: true
    validates :allergens, presence: false
    validates :info, presence: false
end