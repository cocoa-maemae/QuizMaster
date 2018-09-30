class Admin::QuizManagementController < ApplicationController
  def index
    @quiz_list = Quiz.select("rowid, quiz, answer").where("is_delete = 0");
    render '/admin/quiz_management/index'
  end

  def add
    logger.debug(params.inspect)
    quiz = Quiz.new(quiz: params[:question], answer: params[:answer], is_delete: 0)
    quiz.save
  end

  def delete

  end
end
