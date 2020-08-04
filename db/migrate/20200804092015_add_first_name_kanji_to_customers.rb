class AddFirstNameKanjiToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_name_kanji, :string
  end
end
