class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :category
      t.string :name
      t.string :price
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
