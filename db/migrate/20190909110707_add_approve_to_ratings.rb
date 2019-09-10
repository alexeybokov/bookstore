class AddApproveToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :approve, :boolean, default: false
  end
end
