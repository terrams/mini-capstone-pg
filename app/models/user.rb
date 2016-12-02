class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :carted_products
  has_many :products, through: :carted_products 

  def active_order
    if user.carted_products !nil then
      users.carted_products.map{ |order| carted_products.status == "carted"}
    else
      []
    end
  end


end