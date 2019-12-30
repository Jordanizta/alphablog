Rails.application.routes.draw do
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#home'
  get 'about', to: 'welcome#about'
  get 'welcome/test', to: 'welcome#test'
  get 'articles', to: 'welcome#articles'
  get 'meus_artigos', to: 'users#my_articles'
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories
  delete 'categories', to: 'categories#destroy'

end
