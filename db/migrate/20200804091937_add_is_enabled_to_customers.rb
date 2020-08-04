class AddIsEnabledToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :is_enabled, :boolean
  end
end
