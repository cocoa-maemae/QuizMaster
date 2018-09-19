Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  scope :user do
    root 'user/welcome#index'
  end

  scope :admin do 
    root 'admin/quiz_management#index'
    get '/quiz_management', to: 'admin/quiz_management#index'
  end
end
