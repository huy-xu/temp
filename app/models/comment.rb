class Comment < ApplicationRecord
  belongs_to :board
  has_many :read_statuses, dependent: :destroy
  has_many :readers, through: :read_statuses, source: :user

  validates :content, presence: true
  validates :author, length: { maximum: 10 }
end
