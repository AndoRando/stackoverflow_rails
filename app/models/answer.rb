class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :users, through: :votes, as: :votable
  has_many :votes, as: :votable


  validates_presence_of :body, :user_id, :question_id


  def points
    sum = 0
    self.votes.each do |vote|
      sum += vote.value.to_i
    end
    sum
  end
end
