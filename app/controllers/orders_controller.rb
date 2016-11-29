class OrdersController < ApplicationController


  def create
    order = Order.new
    order.user_id = current_user.id
    order.quantity = params[:quantity]
    order.product_id = params[:product_id]
    product = Product.find_by(id: order.product_id)
    order.subtotal = order.quantity * product.price
    order.tax = order.quantity * product.tax
    order.total = order.subtotal + order.tax
    order.save
    flash[:success] = "Order successfully created !!"
    redirect_to "/orders/#{order.id}"
  end
  
  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)
    @product = Product.find_by(id: @order.product_id)
    render 'show.html.erb'    
  end

end
