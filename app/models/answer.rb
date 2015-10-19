class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates_presence_of :body, :user_id, :question_id
end
