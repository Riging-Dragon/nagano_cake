class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.datetime :ordered_date
      t.integer :order_status, default: 0
      t.integer :ordered_zip_code
      t.string :ordered_address
      t.string :ordered_name
      t.integer :total_price
      t.integer :ordered_postage
      t.string :order_method, default: 0

      t.timestamps
    end
  end
end
