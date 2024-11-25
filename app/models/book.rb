class Book < ApplicationRecord
  validates :title, presence: true  # タイトルが空でないことを検証
  validates :body, presence: true   # 本文が空でないことを検証
end
