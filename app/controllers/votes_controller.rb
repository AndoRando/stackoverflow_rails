class VotesController < ApplicationController
  before_action :set_votable

  def new
    if user_signed_in?
      @vote = Vote.new
      @vote.votable = @votable
      @vote.user = current_user
      binding.pry
      @vote.save
    else
      flash[:danger] = "Sign in bro"
    end
    redirect_to :back
  end

  def create
  end

  def destroy

  end

private

  def set_votable
      @votable = Answer.find(params[:answer_id]) if params[:answer_id] != nil
      @votable = Question.find(params[:question_id]) if params[:question_id] != nil
  end

end
