class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :customer_id
      t.integer :delivery_zip_code
      t.string :delivery_address
      t.string :delivery_name

      t.timestamps
    end
  end
end
