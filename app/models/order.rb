class Order < ApplicationRecord
  belongs_to :user
  belongs_to :credit_card
  belongs_to :delivery
  belongs_to :billing_address
  belongs_to :shipping_address
  has_many :order_items
end
