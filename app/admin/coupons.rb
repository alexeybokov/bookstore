# frozen_string_literal: true

ActiveAdmin.register Coupon  do
  permit_params :order_id, :number, :discount
  config.per_page = 25

  index do
    selectable_column
    id_column
    column :order_id
    column(:number) { |coupon| link_to(coupon.number, admin_coupon_path(coupon)) }
    column :discount
    actions
  end

  form do |f|
    f.inputs do
      f.input :number
      f.input :discount
    end
    f.actions
  end
end
