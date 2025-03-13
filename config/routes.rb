Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  resources :users, only:[:show, :edit, :update, :index, :create]
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
