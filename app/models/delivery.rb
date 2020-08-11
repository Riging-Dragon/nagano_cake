class Delivery < ApplicationRecord
	belongs_to :customer

  def full_address
    "〒#{delivery_zip_code}  #{delivery_address}  #{delivery_name}"
  end
end
