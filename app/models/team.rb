class Team < ActiveRecord::Base
  has_many :user_allegiances
  has_many :users, through: :user_allegiances
  has_many :pub_games
  has_many :allegiances
  has_many :pubs, through: :allegiances
end
