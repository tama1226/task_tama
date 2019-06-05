class Label < ApplicationRecord
    validates :name, length: { maximum: 20 }, presence: true

    has_many :tags, dependent: :destroy
    has_many :tasks, through: :tags
end
