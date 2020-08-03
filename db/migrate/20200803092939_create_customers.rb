class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.boolean :is_enabled
      t.string :last_name_kanji
      t.string :first_name_kanji
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :zip_code
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
