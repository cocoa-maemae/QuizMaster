Rails.application.routes.draw do
  resources :controllers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user/quiz_master#index'
  scope :user do
    get '/', to: 'user/quiz_master#index'
  end

  scope :admin do 
    get '/', to: 'admin/quiz_management#index'
    get '/quiz_management', to: 'admin/quiz_management#index'
    post '/quiz_management/add', to: 'admin/quiz_management#add'
  end

  # test
  get '/comments', to: 'comments#index'
end
