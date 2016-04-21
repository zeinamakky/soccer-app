class ChangeHomeTeamIcondIdInPubGames < ActiveRecord::Migration
  def change
    remove_column :pub_games, :home_team_icon_id
  end
end
