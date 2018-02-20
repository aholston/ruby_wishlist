class Item < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, length: {minimum: 3}
  validates :user_id, presence: true

  has_many :wishes, dependent: :destroy
  has_many :wished_by, through: :wishes, source: :user
end
