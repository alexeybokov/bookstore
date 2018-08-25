# frozen_string_literal: true

class Book < ApplicationRecord

  belongs_to :author
  belongs_to :category
  has_many :ratings
  has_many :order_items

  validates :title, :description, :price, :in_stock, presence: true

  mount_uploader :cover, CoverUploader

  scope :newest, -> { order(created_at: :desc) }
  scope :price_asc, -> { order(:price) }
  scope :price_desc, -> { order(price: :desc) }
  #scope :by_title_asc,  -> { order(:title) }
  #scope :by_title_desc, -> { order(title: :desc) }
end
