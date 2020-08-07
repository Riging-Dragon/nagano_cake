class ChangeIsEnabledOfCustomers < ActiveRecord::Migration[5.2]
  def change
  	change_column :customers, :is_enabled, :boolean, default: true
  end
end
