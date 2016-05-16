class AddIconsToGames < ActiveRecord::Migration
  def change
    add_column :games, :home_team_icon, :string
    add_column :games, :away_team_icon, :string
  end
end
