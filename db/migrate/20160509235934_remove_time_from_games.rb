class RemoveTimeFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :time, :time
  end
end
