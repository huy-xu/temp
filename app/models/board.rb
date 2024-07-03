class Board < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :author, presence: true, length: { maximum: 10 }
  
  has_many :comments, dependent: :destroy
end
