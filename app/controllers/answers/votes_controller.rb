class Answers::VotesController < VotesController
  before_action :set_votable

private

  def set_votable
    @votable = Answer.find(params[:answer_id])
  end
end
