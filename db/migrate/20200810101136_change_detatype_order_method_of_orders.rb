class ChangeDetatypeOrderMethodOfOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :order_method, :integer
  end
end
