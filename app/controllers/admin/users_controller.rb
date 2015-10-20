class Admin::UsersController < ApplicationController
  def index
    @questions = Question.all
    @answers = Answer.all
    @users = User.all
    @votes = Vote.all
  end
end
