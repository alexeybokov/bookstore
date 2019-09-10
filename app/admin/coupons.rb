# frozen_string_literal: true

ActiveAdmin.register Coupon  do
  permit_params :number, :discount
  config.per_page = 25

  index do
    selectable_column
    id_column
    column(:number) { |coupon| link_to(coupon.number, admin_coupon_path(coupon)) }
    column :discount
    actions
  end
end
