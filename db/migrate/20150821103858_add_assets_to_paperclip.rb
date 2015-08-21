class AddAssetsToPaperclip < ActiveRecord::Migration
  def change
    add_attachment :paperclip_images, :assets
  end
end
