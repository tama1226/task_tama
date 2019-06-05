class Task < ApplicationRecord

  validates :name, presence: true
  validates :name, length: { maximum: 20 }

  validates :content, presence: true
  validates :content, length: { maximum: 50 }

  belongs_to :user, optional: true
  has_many :tags, dependent: :destroy
  has_many :labels, through: :tags

  accepts_nested_attributes_for :labels

  scope :get_by_name, ->(name){where("name like?", "%#{name}%")}
  scope :get_by_status, ->(status){where("status like?", "%#{status}%")}

  enum priority: { '高': 0, '中': 1 ,'低': 2 }
end
