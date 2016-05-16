class CreateGamesTeamsJoinTable < ActiveRecord::Migration
  def change
    create_table :games_teams, id: false do |t|
      t.integer :team_id
      t.integer :game_id
    end

    add_index :games_teams, :team_id
    add_index :games_teams, :game_id
  
  end
end
