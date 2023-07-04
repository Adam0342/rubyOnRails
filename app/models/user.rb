class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true
    validates :user_allergies, presence: false

  
    has_secure_password
end
  