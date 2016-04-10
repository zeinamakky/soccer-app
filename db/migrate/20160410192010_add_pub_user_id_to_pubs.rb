class AddPubUserIdToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :pub_user_id, :integer
  end
end
