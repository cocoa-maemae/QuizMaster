class User::WelcomeController < ApplicationController
  def index
    @todos = %w(hoge hage)
    render '/user/welcome/index.html'
  end
end
