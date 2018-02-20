class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, length: {minimum: 3}
  validates :username, presence: true, length: {minimum: 5}
  validates :date_hired, presence: true

  has_many :items, dependent: :destroy
  has_many :wishes

  has_many :wished_items, through: :wishes, source: :item
end
