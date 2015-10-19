class VotesController < ApplicationController
  before_action :set_votable

  def new
    @vote = @votable.votes.new
    @vote.user = current_user
    @vote.save
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
