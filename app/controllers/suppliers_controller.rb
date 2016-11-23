class SuppliersController < ApplicationController

  def index
    discounted = params[:discount] == "true"
    if discounted
      @array = Supplier.where("price < ?", 100)
    else
      sort_attribute = params[:sort] || "name"
      sort_order = params[:order] || "asc"
      @array = Supplier.order(sort_attribute => sort_order)
    end
    render 'index.html.erb'
  end
 
  def new
    render 'new.html.erb'
  end

  def create
    supplier = Supplier.new(
      name: params["name"],
      email: params["email"],
      phone: params["phone"]
      )
    supplier.save
#    render 'create.html.erb'
    flash[:info] = "Supplier successfully created !!"
    redirect_to "/suppliers"
  end

  def show
    if params[:id] == "random"
      suppliers = Supplier.all
      @supplier = suppliers.sample
    else
      supplier_id = params[:id]
      @supplier =Supplier.find_by(id: supplier_id)
    end
    render 'show.html.erb'    
  end

  def edit
    supplier_id = params[:id]
    @supplier =Supplier.find_by(id: supplier_id)
    render 'edit.html.erb'
  end

  def update
    supplier_id = params[:id]
    supplier =Supplier.find_by(id: supplier_id)      
    supplier.name = params[:name]
    supplier.email = params[:email]
    supplier.phone = params[:phone]
    supplier.save
    flash[:success] = "Supplier successfully updated !!"
    redirect_to "/suppliers/#{supplier.id}"
  end
  
  def destroy
    supplier_id = params[:id]
    supplier =Supplier.find_by(id: supplier_id)
    supplier.destroy
#    render 'destroy.html.erb'
    flash[:warning] = "Supplier successfully deleted!!"

    redirect_to '/suppliers'
  end

  def search
    search_term = params[:search]
    @array = Supplier.where('name LIKE ?', '%' + search_term = '%')
    render 'index.html.erb'
  end  
end
