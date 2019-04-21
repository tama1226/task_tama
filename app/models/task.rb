class Task < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 20 }

  validates :content, presence: true
  validates :content, length: { maximum: 50 }
end
