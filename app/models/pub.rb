class Pub < ActiveRecord::Base
  belongs_to :pub_user
  has_many :pub_photos
  has_many :pub_games
  has_many :games, through: :pub_games
  has_many :allegiances
  has_many :teams, through: :allegiances
end
