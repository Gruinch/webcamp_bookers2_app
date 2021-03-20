Rails.application.routes.draw do
  devise_for :users
  root to:'homes#top'
  get "about"=>"homes#about",as:"about"
  resources :books,only:[:new, :create, :show, :index, :edit, :destroy]
  resources :users,only:[:show, :edit, :update, :inde]
  
end
