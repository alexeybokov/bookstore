class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :ratings
  has_one :billing_address
  has_one :shipping_address
  #validates :name, presence: true
  validates :email, presence: true, format: { with: /.+@.+\..+/i }

  def current_order
    orders.find_or_create_by(state: :cart)
  end
end
