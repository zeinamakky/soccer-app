class AddPubIdToUserGames < ActiveRecord::Migration
  def change
    add_column :user_games, :pub_id, :integer
  end
end
