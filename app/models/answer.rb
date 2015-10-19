class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :users, through: :votes, as: :votable


  validates_presence_of :body, :user_id, :question_id
end
