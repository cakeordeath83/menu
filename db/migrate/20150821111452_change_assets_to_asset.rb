class ChangeAssetsToAsset < ActiveRecord::Migration
  def change
    rename_column :paperclip_images, :assets_file_name, :asset_file_name
    rename_column :paperclip_images, :assets_content_type, :asset_content_type
    rename_column :paperclip_images, :assets_file_size, :asset_file_size
    rename_column :paperclip_images, :assets_updated_at, :asset_updated_at
  end
end
