class Product < ApplicationRecord

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
