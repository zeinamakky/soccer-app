class CreateAllegiances < ActiveRecord::Migration
  def change
    create_table :allegiances do |t|
      t.integer :team_id
      t.integer :pub_id

      t.timestamps null: false
    end
  end
end
