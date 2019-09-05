# frozen_string_literal: true

ActiveAdmin.register Category, as: 'All Category' do
  permit_params :title, :book_id
  config.per_page = 25

  index do
    selectable_column
    id_column
    column(:title) { |category| link_to(category.title, admin_all_category_path(category)) }
    actions
  end

  form do |f|
    f.inputs do
      f.input :title, input_html: { style: 'width: 50%;' }
    end
    f.actions
  end
end
