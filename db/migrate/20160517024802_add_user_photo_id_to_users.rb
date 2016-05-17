class AddUserPhotoIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_photo_id, :integer
    remove_column :users, :filename, :string
    remove_column :users, :file_contents, :binary
    remove_column :users, :content_type, :string

  end
end
