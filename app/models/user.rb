class User < ActiveRecord::Base
  has_many :questions, through: :votes, as: :votable
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :votes, dependent: :destroy
  attr_accessor :password
  before_save :encrypt_password
  validates_confirmation_of :password
  validates_presence_of :name, :email


  def encrypt_password
    if password != nil
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    elsif self.password_salt != nil
      self.password_salt = self.password_salt
      self.password_hash = self.password_hash
      password = "password"
    end
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def voted?(votable)
    votable.votes.each do |vote|
      if vote.user_id == self.id
        return true
      end
    end
    false
  end

  def find_vote(votable)
    votable.votes.each do |vote|
      if vote.user_id == self.id
        return vote
      end
    end
  end

  def make_admin
    self.update(is_admin?: true)
  end
end
