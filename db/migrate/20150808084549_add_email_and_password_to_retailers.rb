class AddEmailAndPasswordToRetailers < ActiveRecord::Migration
  def change    
    add_column :retailers, :email, :string
    add_column :retailers, :password_digest, :string
  end
end
