class ProductsController < ApplicationController

    def index
        @products = Product.all 
    end 

    def show
    end 

    def new
        require_login
        @product=Product.new
    end 

    def create
        require_login
        @product = Product.new(product_params)
        if @product.save
            redirect_to new_product_review_path(@product)
        else 
            render :new 
        end 
    end 

    def cleanser
        @products= Product.cleanser
        render :index
    end 

    def makeup
        @products= Product.makeup
        render :index
    end 


    private

    def product_params
        params.require(:product).permit(:brand, :title, :category)
    end 

end
