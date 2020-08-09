class Genre < ApplicationRecord
	has_many :products

  validates :category, presence: true
  def self.search(search)
      if search
        where(['category LIKE ?', "%#{search}%"])
      else
        all
      end
    end
end
