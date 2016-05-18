class User < ActiveRecord::Base
  acts_as_messageable
  belongs_to :user_login
  has_one :user_photo
  has_many :reviews
  has_many :user_games
  has_many :games, through: :user_games
  has_many :user_allegiances
  has_many :teams, through: :user_allegiances
end
