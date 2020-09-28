class CreateBuyerAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_addresses do |t|
      t.string :zipnumber, false
      t.string :deliveryarea_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :buildingname, null: false
      t.string :phonenumber, null: false
      t.references :item_buyer, foreign_key: true
      t.timestamps
    end
  end
end
