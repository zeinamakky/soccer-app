class AddMatchIdToUserGames < ActiveRecord::Migration
  def change
    add_column :user_games, :match_id, :integer
  end
end
