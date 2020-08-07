class Product < ApplicationRecord
	belongs_to :genre
	has_many :cart_items
	has_many :order_details
	def self.search(search)
      if search
        where(['product_name LIKE ?', "%#{search}%"])
      else
        all
      end
    end
end
