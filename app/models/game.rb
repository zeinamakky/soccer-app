class Game < ActiveRecord::Base
  has_many :pub_games
  has_many :pubs, through: :pub_games

  def pretty_date

    date.to_time.strftime("%A, %d %b %Y %l:%M %p")
  end
end
