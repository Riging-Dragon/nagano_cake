class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.string :image
      t.text :description
      t.integer :non_taxed_price
      t.integer :postage
      t.boolean :is_capable

      t.timestamps
    end
  end
end
