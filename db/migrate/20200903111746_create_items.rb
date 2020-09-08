class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,null: false, default: ""
      t.text :detail, null: false
      t.integer :category, null: false
      t.integer :status, null: false, default: 0
      t.integer :deliverycost, null: false, default: 0
      t.integer :deliveryareas, null: false, default: 0
      t.integer :deliverydates, null: false, default: 0
      t.integer   :price, null: false, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
