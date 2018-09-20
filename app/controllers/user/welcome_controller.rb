class User::WelcomeController < ApplicationController
  def index
    render '/user/welcome/index.html'
  end
end
