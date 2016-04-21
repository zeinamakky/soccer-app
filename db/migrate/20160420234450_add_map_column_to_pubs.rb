class AddMapColumnToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :map, :string
  end
end
