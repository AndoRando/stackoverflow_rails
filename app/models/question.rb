class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :users, through: :votes, as: :votable

  validates_presence_of :title, :body, :user_id
end
