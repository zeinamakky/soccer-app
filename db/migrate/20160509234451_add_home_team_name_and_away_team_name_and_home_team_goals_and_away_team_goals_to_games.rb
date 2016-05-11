class AddHomeTeamNameAndAwayTeamNameAndHomeTeamGoalsAndAwayTeamGoalsToGames < ActiveRecord::Migration
  def change
    add_column :games, :home_team_name, :string
    add_column :games, :away_team_name, :string
    add_column :games, :home_team_goals, :integer
    add_column :games, :away_team_goals, :integer
    remove_column :games, :away_team_id, :integer
    remove_column :games, :home_team_id, :integer
  end
end
