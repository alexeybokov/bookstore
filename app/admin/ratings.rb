# frozen_string_literal: true

ActiveAdmin.register Rating do
  permit_params :review, :rating_number, :book_id, :user_id
  config.per_page = 25

  index do
    selectable_column
    id_column
    column(:book) { |object| link_to(object.book.title, admin_book_path(object.book)) }
    column(:user) { |object| link_to(object.user.email, admin_user_path(object.user)) }
    column :rating_number
    column :review
    actions
  end

  # form do |f|
  #   f.inputs do
  #     f.input :title, input_html: { style: 'width: 50%;' }
  #   end
  #   f.actions
  # end
end
