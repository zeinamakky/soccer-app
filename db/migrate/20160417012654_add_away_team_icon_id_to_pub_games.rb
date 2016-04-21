class AddAwayTeamIconIdToPubGames < ActiveRecord::Migration
  def change
    add_column :pub_games, :away_team_icon_id, :integer
    rename_column :pub_games, :team_icon_id, :home_team_icon_id
  end
end
