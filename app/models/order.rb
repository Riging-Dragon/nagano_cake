class Order < ApplicationRecord
	belongs_to :order
	has_many :order_details
end
