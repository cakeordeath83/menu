class RemoveSpecialfromCategoryandaddtoItem < ActiveRecord::Migration
  def change
    remove_column :categories, :special, :boolean
    add_column :items, :special, :boolean
  end
end
