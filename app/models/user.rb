class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :ratings
  has_one :delivery_info
  #validates :name, presence: true
  validates :email, presence: true, format: { with: /.+@.+\..+/i }

  def current_order
    orders.find_or_create_by(state: :cart)
  end

  def load_delivery_info
    return delivery_info if delivery_info.present?
    build_delivery_info
  end
end
