class User::WelcomeController < ApplicationController
  def index
    render '/user/welcome/index.html.erb'
  end
end
