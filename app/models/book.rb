class Book < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  
  # 空でないように設定
  validates :title, presence: true
  
  # 空でない、かつ最大200文字までに設定
  validates :body, presence: true, length: { maximum: 200 }
  
end
