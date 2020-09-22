class DeliveryInfo < ApplicationRecord
  belongs_to :user
  validates :first_name,
            :last_name,
            :street_1,
            :zip_code,
            :city,
            :region,
            :phone,
            :country, presence: true
  validates :user, presence: true
end
