class Admin::QuizManagementController < ApplicationController
  def index
    @quiz_list = Quiz.select("rowid, quiz, answer").where("is_delete = 0");
    #logger.debug(quiz_list.inspect)
    render '/admin/quiz_management/index'
  end

  def add

  end

  def delete

  end
end
