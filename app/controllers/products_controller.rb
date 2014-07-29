class ProductsController < ApplicationController

    before_action :signed_in_user, only: [:new, :edit, :update , :destroy ,:create]
    before_action :admin_user,     only: [:new, :edit, :update , :destroy ,:create]
  

    def new
   	  @product=Product.new
   	  8.times {@product.assets.build}
   	  
    end

    def create 
    	@product= Product.new(product_params)
    	if @product.save
          # Handle a successful save.
          flash[:success] = "Successful created product!"
          redirect_to @product
        else
          render 'new'
        end
    end

    def update 
    	@product= Product.find(params[:id])
    	if @product.update_attributes(product_params)
          # Handle a successful save.
          flash[:success] = "Product updated!"
          redirect_to product_url
        else
          render 'edit'
        end
    end

    def show
    	@product= Product.find(params[:id])
    end

    def index
    	@products=Product.paginate(page: params[:page])
    end 

   
    def destroy 
          Product.find(params[:id]).destroy
          flash[:success] = "Product deleted."
          redirect_to products_url
    end

    def edit
       @product= Product.find(params[:id])
       8.times {@product.assets.build}
    end

   
    private 

       def product_params 
          params.require(:product).permit(:price, :name, :description, :buy_url,
                                   assets_attributes: [:asset, :_destroy, :id])
       end 

       def admin_user
          redirect_to(root_url) unless current_user.admin?
       end

end