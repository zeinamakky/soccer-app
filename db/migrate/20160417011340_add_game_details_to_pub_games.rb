class AddGameDetailsToPubGames < ActiveRecord::Migration
  def change
    add_column :pub_games, :home_team_id, :integer
    add_column :pub_games, :away_team_id, :integer
    add_column :pub_games, :date, :Date
    add_column :pub_games, :time, :Time
    add_column :pub_games, :channel, :string
    add_column :pub_games, :team_icon_id, :string
    add_column :pub_games, :location, :string
    add_column :pub_games, :league, :string
    remove_column :pub_games, :game_id, :integer
  end
end
