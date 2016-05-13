class Game < ActiveRecord::Base
  has_many :pub_games
  has_many :pubs, through: :pub_games
  has_many :user_games
  has_many :users, through: :user_games
  def pretty_date

    date.to_time.strftime("%A, %d %b %Y %l:%M %p")
  end

  def end_date
    (date.to_time + 2*60*60).strftime("%A, %d %b %Y %l:%M %p")
    
  end
  def ending_time
    (date.to_time + 2*60*60).strftime("%Y%m%eT%H%M%S")
  end

  def starting_time
    date.to_time.strftime("%Y%m%eT%H%M%S")
  end
end
