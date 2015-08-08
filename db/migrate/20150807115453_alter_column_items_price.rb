class AlterColumnItemsPrice < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.change :price, :decimal, :precision => 10, :scale => 2
    end
  end
  
  def self.down
    change_table :items do |t|
      t.change :price, :integer
    end
  end
  
end
