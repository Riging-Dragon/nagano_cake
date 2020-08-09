class Genre < ApplicationRecord
	has_many :products
	enum is_capable:[販売中:0, 販売停止中:1]

  validates :category, presence: true
  def self.search(search)
      if search
        where(['category LIKE ?', "%#{search}%"])
      else
        all
      end
    end
end
