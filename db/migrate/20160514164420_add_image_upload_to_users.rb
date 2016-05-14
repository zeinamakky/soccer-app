class AddImageUploadToUsers < ActiveRecord::Migration
  def change
    add_column :users, :filename, :string
    add_column :users, :content_type, :string
    add_column :users, :file_contents, :binary
  end
end
