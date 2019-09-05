ActiveAdmin.register Author do
  permit_params :first_name, :last_name, :biography

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :biography
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  # form do |f|
  #   f.inputs do
  #     f.input :email
  #     f.input :password
  #     f.input :password_confirmation
  #   end
  #   f.actions
  # end
end
