class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :users, through: :votes, as: :votable
  has_many :votes, as: :votable


  validates_presence_of :title, :body, :user_id

  def points
    sum = 0
    self.votes.each do |vote|
      sum += vote.value.to_i
    end
    sum
  end
end
