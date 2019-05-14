class Task < ApplicationRecord

  scope :get_by_name, ->(name){where("name like?", "%#{name}%")}
  scope :get_by_status, ->(status){where("status like?", "%#{status}%")}

  validates :name, presence: true
  validates :name, length: { maximum: 20 }

  validates :content, presence: true
  validates :content, length: { maximum: 50 }
end
