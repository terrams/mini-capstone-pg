class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def update_cart
    items = current_user.carted_products.where( status: "carted")
    items.each do |item|
      item.status = "purchased"
      item.order_id = order_id
    end 
    order_id = item.order_id
  end

end
