class Admin::QuizManagementController < ApplicationController
  def index
    render '/admin/quiz_management/index.html.erb'
  end
end
