class ProductsController < ApplicationController


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
    	@product= Product.new(product_params)
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
    	@products=Product.all
    end 

   
    def destroy 
    end 





    private 

       def product_params 
          params.require(:product).permit(:price, :name, :description,
                                   assets_attributes: :asset)
       end 

end