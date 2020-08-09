class Product < ApplicationRecord
	belongs_to :genre
	has_many :cart_items
	has_many :order_details
  attachment :image
  validates :name, presence: true
  validates :description, presence: true
  validates :non_taxed_price, presence: true
	def self.search(search)
      if search
        where(['name LIKE ?', "%#{search}%"])
      else
        all
      end
    end
end
