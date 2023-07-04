Rails.application.routes.draw do
    root to: 'home#index'
    get 'root_path', to: 'home#index'

    get 'register', to: 'users#register'
    post 'register_path', to: 'users#create_user'

    get 'login', to: 'users#login'
    post 'login_path', to: 'users#create_session'
    post 'destroy', to: 'users#destroy_session'
    post 'allergens', to: 'users#allergens'

    post 'personal_list_manage', to: 'recipe#personal_list_manage'

    get 'recipe', to: 'recipe#index'
    get 'recipe_personal', to: 'recipe#view-personal-list'
    get 'add_recipe', to: 'recipe#add_recipe'
    post 'add_recipe', to: 'recipe#'

    get 'add_ingredient', to: 'recipe#add_ingredient'
end