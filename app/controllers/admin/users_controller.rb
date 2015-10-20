class Admin::UsersController < ApplicationController
  def index
    @questions = Question.all
    @answers = Answer.all
    @users = User.all
    @votes = Vote.all

    @today = Date.today.strftime("%Y%m%d")
    @today_questions = @questions.select { |question|
      question.created_at.strftime("%Y%m%d") == @today}
    @today_answers = @answers.select { |answer|
      answer.created_at.strftime("%Y%m%d") == @today}
    @today_votes = @votes.select { |vote|
      vote.created_at.strftime("%Y%m%d") == @today}
  end


end
