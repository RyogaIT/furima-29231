class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,null: false, default: ""
      t.text :detail, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false, default: 0
      t.integer :deliverycost_id, null: false, default: 0
      t.integer :deliveryareas_id, null: false, default: 0
      t.integer :deliverydates_id, null: false, default: 0
      t.integer   :price, null: false, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
