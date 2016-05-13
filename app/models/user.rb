class User < ActiveRecord::Base
  belongs_to :user_login
  has_many :reviews
  has_many :user_games
  has_many :games, through: :user_games
end
