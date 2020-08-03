class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :ordered_price
      t.integer :ordered_item_count
      t.integer :production_status

      t.timestamps
    end
  end
end
