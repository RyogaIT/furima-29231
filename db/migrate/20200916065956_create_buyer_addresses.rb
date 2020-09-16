class CreateBuyerAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_addresses do |t|
      t.string :zipnumber, false
      t.string :prefecture_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.integer :buildingname, null: false
      t.integer :phonenumber, null: false
      t.reference :item_buyer, null: false
      t.timestamps
    end
  end
end
