class CreateItemBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :item_buyers do |t|

      t.timestamps
    end
  end
end
