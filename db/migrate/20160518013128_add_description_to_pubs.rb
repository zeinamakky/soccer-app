class AddDescriptionToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :description, :text
  end
end
