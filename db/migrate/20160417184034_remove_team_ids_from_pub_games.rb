class RemoveTeamIdsFromPubGames < ActiveRecord::Migration
  def change
    remove_column :pub_games, :home_team_id, :integer
    remove_column :pub_games, :away_team_id, :integer
    add_column :pub_games, :home_team, :string
    add_column :pub_games, :away_team, :string

  end
end
