class ChangeDateToDateTimeInPubGames < ActiveRecord::Migration
  def change
    change_column :pub_games, :date, :datetime
  end
end
