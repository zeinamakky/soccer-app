class AddLeagueToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :league, :string
    remove_column :teams, :location, :string
  end
end
