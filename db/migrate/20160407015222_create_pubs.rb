class CreatePubs < ActiveRecord::Migration
  def change
    create_table :pubs do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :fax
      t.string :website
      t.string :email

      t.timestamps null: false
    end
  end
end
