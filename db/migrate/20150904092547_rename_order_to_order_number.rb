class RenameOrderToOrderNumber < ActiveRecord::Migration
  def change
    rename_column :categories, :order, :order_number
  end
end
