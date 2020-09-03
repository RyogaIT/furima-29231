class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,null: false, default: ""
      t.text :detail, null: false, default: ""
      t.integer :category, null: false, default: ""
      t.integer :status, null: false, default: ""
      t.integer :deliverycost, null: false, default: ""
      t.integer :deliveryareas, null: false, default: ""
      t.integer :deliverydates, null: false, default: ""
      t.integer   :price, null: false, default: ""
      t.integer   :price, null: false, default: ""
      t.reference :user, foreign_key: true
      t.reference :buyer, foreign_key: true
      t.timestamps
    end
  end
end
