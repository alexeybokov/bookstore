ActiveAdmin.register Book do
  permit_params :title, :description, :price, :in_stock, :cover, :author_id, :category_id
  config.per_page = 25

  index do
    selectable_column
    id_column
    column :cover do |cover|
      image_tag(cover.cover_url, size: '150x225')
    end
    column(:title) { |book| link_to(book.title, admin_book_path(book)) }
    column :description
    column :price
    column :in_stock
    column(:author_id) { |book| book.author.first_name + ' ' + book.author.last_name }
    column(:category_id) { |book| link_to(book.category.title, admin_all_category_path(book.category)) }
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :cover do |cover|
        image_tag(cover.cover_url, size: '200x300')
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
