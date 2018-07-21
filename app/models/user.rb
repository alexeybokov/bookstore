class User < ApplicationRecord
  has_many :orders
  has_many :ratings
  belongs_to :billing_address
  belongs_to :shipping_address
  validates :name, presence: true
  validates :email, presence: true, format: { with: /.+@.+\..+/i }
end
