class AddPhotoFieldsToPubPhotos < ActiveRecord::Migration
  def change
    add_column :pub_photos, :filename, :string
    add_column :pub_photos, :content_type, :string
    add_column :pub_photos, :file_contents, :binary
  end
end
