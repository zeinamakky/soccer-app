class AddHomeTeamIconIdToPubGames < ActiveRecord::Migration
  def change
    add_column :pub_games, :home_team_icon_id, :integer
  end
end
