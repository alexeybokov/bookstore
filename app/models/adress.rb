class Adress < ApplicationRecord
  validates :address, :zipcode, :city, :phone, :country, presence: true
end
