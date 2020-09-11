class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,null: false, default: ""
      t.text :detail, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :deliverycost_id, null: false
      t.integer :deliveryarea_id, null: false
      t.integer :deliverydate_id, null: false
      t.integer   :price, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
