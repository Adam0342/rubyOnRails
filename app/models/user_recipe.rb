class UserRecipe < ApplicationRecord
    validates :user_id, presence: true, uniqueness: true
    validates :recipe_id, presence: false
    validates :ingredients, presence: false
    validates :user_allergens, presence: false
end