class AddUserLoginIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_login_id, :integer
  end
end
