class AddMoreFieldsToRetailer < ActiveRecord::Migration
  def change
    add_column :retailers, :address2, :string
    add_column :retailers, :address3, :string
    add_column :retailers, :city, :string
    add_column :retailers, :postcode, :string
    add_column :retailers, :openinghours, :string
  end
end
