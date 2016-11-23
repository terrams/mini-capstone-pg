class UpdatesToImageTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :image, :image_file
    add_column :images, :product_id, :integer
  end
end
