Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root "home#top"
get 'home/about' => "home#about", as: "about"
resources :books

# devise_scope :user do
# 	get 'users/:id' => ' users#edit', as: :new_user
# end
resources :users


end
