class RemoveTeamNamesFromPubGames < ActiveRecord::Migration
  def change
    remove_column :pub_games, :home_team, :string
    remove_column :pub_games, :away_team, :string

  end
end
