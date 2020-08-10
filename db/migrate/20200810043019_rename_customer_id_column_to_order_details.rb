class RenameCustomerIdColumnToOrderDetails < ActiveRecord::Migration[5.2]
  def change
  	rename_column :order_details, :customer_id, :order_id
  end
end
