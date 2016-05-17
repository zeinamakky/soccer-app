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

  def self.dedupe
    # find all models and group them on keys which should be common
    grouped = all.group_by { |model| [model.date, model.home_team_name, model.away_team_name] }
    grouped.values.each do |duplicates|
      if duplicates.length > 1
        duplicates.sort_by! { |d| d.id }
        # p duplicates.map { |d| "#{d.id} #{d.home_team_name}" }.join(', ')
        # the first one we want to keep right?
        first_one = duplicates.shift # or pop for last one
        # if there are any more left, they are duplicates
        # so delete all of them
        # p duplicates.map { |d| "#{d.id} #{d.home_team_name}" }.join(', ')
        duplicates.each { |double| double.destroy } # duplicates can now be destroyed
      end
    end
    puts 'done!'
  end
end
