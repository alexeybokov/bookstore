# frozen_string_literal: true

ActiveAdmin.register Rating do
  permit_params :review, :rating_number, :book_id, :user_id, :approve
  config.per_page = 25

  index do
    selectable_column
    id_column
    column(:book) { |object| link_to(object.book.title, admin_book_path(object.book)) }
    column(:cover) do |object|
      image_tag(object.book.cover_url, size: '150x225')
    end
    column(:user) { |object| link_to(object.user.email, admin_user_path(object.user)) }
    column :rating_number
    column :approve
    column :review
    actions
  end
end
