class ProductsController < ApplicationController

    def index
        @products = Product.all 
    end 

    def show
    end 

    def new
        @product=Product.new
    end 

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to new_product_review_path(@product)
        else 
            render :new 
        end 
    end 


    private

    def product_params
        params.require(:product).permit(:brand, :title, :category)
    end 

end
