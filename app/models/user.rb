class User < ApplicationRecord
  has_many :comments
  has_many :read_statuses

  validates :name, presence: true, length: { maximum: 10 }
end
