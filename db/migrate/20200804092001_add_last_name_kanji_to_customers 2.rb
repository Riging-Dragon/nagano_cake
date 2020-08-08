class AddLastNameKanjiToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :last_name_kanji, :string
  end
end
