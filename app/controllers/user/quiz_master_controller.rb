class User::QuizMasterController < ApplicationController
  def index
    logger.debug("hoge")
    render '/user/quiz_master/index'
  end

  def start
    render '/user/quiz_master/index'
  end

  def answer
  end
end
