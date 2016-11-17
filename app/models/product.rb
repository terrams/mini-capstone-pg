class Product < ApplicationRecord

  def sale_message
    if price.to_f < 2.0 
      "Discounted Item!"
    else
      "Everyday value"
    end
  end

  def tax
    (price.to_f * 0.09).round(2)
  end

  def total 
    (price.to_f + tax).round(2)
  end
  
  def discount_class_name
    if sale_message  == "Discounted Item!"
      "discount-item"
    end
  end

  def discounted?
    price.to_f < 2.0 
  end

end
