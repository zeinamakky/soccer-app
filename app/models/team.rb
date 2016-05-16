class Team < ActiveRecord::Base
  has_many :user_allegiances
  has_many :users, through: :user_allegiances
  has_many :pub_games
end
