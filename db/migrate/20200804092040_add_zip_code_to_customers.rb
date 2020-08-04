class AddZipCodeToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :zip_code, :string
  end
end
