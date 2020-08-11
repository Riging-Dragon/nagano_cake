class Product < ApplicationRecord
	belongs_to :genre, -> { with_deleted }
	has_many :cart_items
	has_many :order_details
  attachment :image
  enum is_capable: {sales:0, stopped:1}
  #enum is_capable: { sales: 0, stopped: 1 }
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
