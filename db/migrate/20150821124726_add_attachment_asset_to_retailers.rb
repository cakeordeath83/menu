class AddAttachmentAssetToRetailers < ActiveRecord::Migration
  def self.up
    change_table :retailers do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :retailers, :asset
  end
end
