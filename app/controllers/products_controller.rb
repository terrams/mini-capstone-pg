class ProductsController < ApplicationController

  def index
    discounted = params[:discount] == "true"
    if discounted
      @array = Product.where("price < ?", 100)
    elsif params[:category_name] != nil
      category = Category.find_by(name: params[:category_name])
      @array = category.products
    else
      sort_attribute = params[:sort] || "name"
      sort_order = params[:order] || "asc"
      @array = Product.order(sort_attribute => sort_order)
    end
    render 'index.html.erb'
  end
 
  def new
    render 'new.html.erb'
  end

  def create
    product = Product.new(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      supplier_id: params["supplier_id"]
      )
    product.save
#    render 'create.html.erb'
    flash[:info] = "Product successfully created !!"
    redirect_to "/products"
  end

  def show
    if params[:id] == "random"
      products = Product.all
      @product = products.sample
    else
      product_id = params[:id]
      @product =Product.find_by(id: product_id)
    end
    render 'show.html.erb'    
  end

  def edit
    product_id = params[:id]
    @product =Product.find_by(id: product_id)
    render 'edit.html.erb'
  end

  def update
    product_id = params[:id]
    product =Product.find_by(id: product_id)      
    product.name = params[:name]
    product.price = params[:price]
    product.description = params[:description]
    product.supplier_id = params[:supplier_id]    
    product.save
    flash[:success] = "Product successfully updated !!"
    redirect_to "/products/#{product.id}"
  end
  
  def destroy
    product_id = params[:id]
    product =Product.find_by(id: product_id)
    product.destroy
#    render 'destroy.html.erb'
    flash[:warning] = "Product successfully deleted!!"

    redirect_to '/products'
  end

  def search
    search_term = params[:search]
    @array = Product.where('name LIKE ?', '%' + search_term = '%')
    render 'index.html.erb'
  end

end
