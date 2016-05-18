class AddDateToPubGames < ActiveRecord::Migration
  def change
    add_column :pub_games, :date, :date
  end
end
