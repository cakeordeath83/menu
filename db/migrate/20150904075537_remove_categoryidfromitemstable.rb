class RemoveCategoryidfromitemstable < ActiveRecord::Migration
  def change
    remove_column :items, :category_id, :string
  end
end
