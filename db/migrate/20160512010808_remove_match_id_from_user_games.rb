class RemoveMatchIdFromUserGames < ActiveRecord::Migration
  def change
    remove_column :user_games, :match_id, :integer

  end
end
