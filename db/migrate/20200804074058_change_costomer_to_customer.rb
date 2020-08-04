class ChangeCostomerToCustomer < ActiveRecord::Migration[5.2]
  def change
  	rename_table :costomers, :customers
  end
end
