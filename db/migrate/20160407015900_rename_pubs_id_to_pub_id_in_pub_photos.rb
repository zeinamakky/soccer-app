class RenamePubsIdToPubIdInPubPhotos < ActiveRecord::Migration
  def change
    rename_column :pub_photos, :pubs_id, :pub_id
  end
end
