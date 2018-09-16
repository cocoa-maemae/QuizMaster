Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # general users
  root 'welcome#index'
  get '/welcome', to: 'welcome#index'

  # administrator
  get '/admin', to: 'quiz_management#index'
end
