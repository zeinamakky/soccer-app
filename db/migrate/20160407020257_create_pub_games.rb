class CreatePubGames < ActiveRecord::Migration
  def change
    create_table :pub_games do |t|
      t.integer :pub_id
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
