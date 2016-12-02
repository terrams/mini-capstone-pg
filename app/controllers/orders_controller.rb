class OrdersController < ApplicationController

  def create
    items = current_user.carted_products.where( status: "carted")
    items.each do |item|
      order = Order.new
      order.user_id = current_user.id
      order.subtotal = item.quantity * item.product.price
      order.tax = item.quantity * item.product.tax
      order.total = order.subtotal + order.tax
      order.save
    end

    order = Order.last
    items = current_user.carted_products.where( status: "carted")
    items.each do |item|
      item.status = "purchased"
      item.order_id = order.id
      item.save
    end 
    flash[:success] = "Order successfully created !!"
    redirect_to "/orders/#{order.id}"
  end
  
  def show
    order = Order.last
    @ordered_items = current_user.carted_products.where(order_id: order.id, status: "purchased")    
    render 'show.html.erb'    
  end

end
