class CreditCard < ApplicationRecord
  has_one :order
  validates :number, :cvv, :expiration_month, :expiration_year, :first_name, :last_name, presence: true
end
