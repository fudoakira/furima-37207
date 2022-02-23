class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,               null: false
      t.text :content,                   null: false
      t.integer :price,                  null: false
      t.references :user,                null: false, foreign_key: true
      t.integer :category_id,            null: false
      t.integer :item_quality_id,        null: false
      t.integer :shipping_fee_burden_id, null: false
      t.integer :prefecture_id,          null: false
      t.integer :days_to_ship_id,        null: false
      t.timestamps
    end
  end
end
