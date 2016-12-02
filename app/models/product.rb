class Product < ApplicationRecord
  has_many :carted_products
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :users, through: :carted_products

  def sale_message
    if price < 2.0 
      "Discounted Item!"
    else
      "Everyday value"
    end
  end

  def tax
    price * 0.09
  end

  def total 
    price + tax
  end
  
  def discount_class_name
    if sale_message  == "Discounted Item!"
      "discount-item"
    end
  end

  def discounted?
    price < 2.0 
  end

  def in_stock?
    stock_quantity > 0
  end  

end
