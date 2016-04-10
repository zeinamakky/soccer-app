class CreatePubPhotos < ActiveRecord::Migration
  def change
    create_table :pub_photos do |t|
      t.integer :pubs_id
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
