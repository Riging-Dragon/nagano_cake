class Product < ApplicationRecord
	belongs_to :genre, -> { with_deleted }
	has_many :cart_items
	has_many :order_details
  attachment :image
  enum is_capable: {sales:0, stopped:1}#論理削除の定義データ型の選択をミスった。。。integerが正解
  #enum is_capable: { sales: 0, stopped: 1 }
  validates :name, presence: true
  validates :description, presence: true
  validates :non_taxed_price, presence: true
  #下記の記述は曖昧検索機能の実装。ここ割と難しかった。
	def self.search(search)
      if search
        where(['name LIKE ?', "%#{search}%"])
      else
        all
      end
    end
end
