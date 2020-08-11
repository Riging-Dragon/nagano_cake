class ChangeDataIsCapableToProducts < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :is_capable, :integer
  end
end

