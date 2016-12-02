class CartedProductsController < ApplicationController

  def index
    # @items = CartedProduct.where(["user_id = ? and status = ?", current_user.id, "carted"])
    @items = current_user.carted_products.where( status: "carted", user_id: current_user.id)
    if @items.count > 0
      render 'index.html.erb'
    else 
      redirect_to "/products"
    end
  end

  def create
    cart_item = CartedProduct.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      status: "carted"
      )
    cart_item.save
    flash[:info] = "Item successfully Added to cart !!"
    redirect_to "/cart"
  end

  def destroy
    product_id = params[:id]
    product = CartedProduct.find_by(id: product_id)
    product.status = "removed"
    product.save
#    render 'destroy.html.erb'
    flash[:warning] = "Product removed from cart!"

    redirect_to '/cart'
  end

end

