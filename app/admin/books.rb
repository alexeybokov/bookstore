ActiveAdmin.register Book do
  permit_params :title, :description, :price, :in_stock, :author_id, :category_id,
  config.per_page = 25

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :price
    column :in_stock
    column :author_id
    column :category_id
    # column(:user) { |category| link_to(category.user.email, admin_image_path(category.user)) }
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :cover do |image|
        image_tag(image.picture_url, size: '150x100')
      end
      row(:category)
      # row(:user) { |category| link_to(category.user.email, admin_user_path(category.user)) }
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs 'New Book' do
      f.input :author_id, as: :select, collection: Hash[Author.all.map { |author| [author.first_name, author.id] }], include_blank: true
      f.input :category_id, as: :select, collection: Hash[Category.all.map { |category| [category.title, category.id] }], include_blank: true
      f.input :title
      f.input :description
      f.input :price
      f.input :in_stock
      f.input :cover
    end
    f.actions
  end
end
