require 'rails_helper'

describe User do
  it { should have_many :questions }
  it { should validate_confirmation_of :password }
end
