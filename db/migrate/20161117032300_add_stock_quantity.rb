class AddStockQuantity < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :stock_quantity, :integer
  end
end
