class CreateItemBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :item_buyers do |t|
      t.reference :user, foreign_key: true
      t.reference :buyer, foreign_key: true
      t.timestamps
    end
  end
end
