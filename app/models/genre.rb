class Genre < ApplicationRecord
	has_many :products
	enum is_capable:[販売中:0, 販売停止中:1]
	acts_as_paranoid

  validates :category, presence: true
  #下記の記述は曖昧検索機能の実装。ここ割と難しかった。
  def self.search(search)
      if search
        where(['category LIKE ?', "%#{search}%"])
      else
        all
      end
    end
end
