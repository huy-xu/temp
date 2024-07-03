class Comment < ApplicationRecord
  belongs_to :board

  validates :content, presence: true
  validates :author, length: { maximum: 10 }
end
