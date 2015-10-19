require 'rails_helper'

describe Answer do
  it { should belong_to :user }
  it { should belong_to :question }
  it { should validate_presence_of :body }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :question_id }
end