class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :ratings
  has_many :order_items

  validates :title, :description, :price, :in_stock, presence: true

  mount_uploader :cover, CoverUploader
end
