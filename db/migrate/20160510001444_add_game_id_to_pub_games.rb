class AddGameIdToPubGames < ActiveRecord::Migration
  def change
    add_column :pub_games, :game_id, :integer
    remove_column :pub_games, :date, :date
    remove_column :pub_games, :time, :time
    remove_column :pub_games, :league, :league
    remove_column :pub_games, :channel, :channel
    remove_column :pub_games, :location, :location
  end
end
