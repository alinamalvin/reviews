class ReviewsController < ApplicationController
before_action :get_product, except: :create
#before_action :product_nil 

def index
end 

def new
    require_login
    @review=Review.new 
end 

def create
    @product= Product.find_by(id: params[:review][:product_id])
    product_nil
    @review= current_user.reviews.build(review_params) 
    if @review.save
        redirect_to product_reviews_path(@review.product)
    else 
         render :new
    end 
end 

private 

def product_nil
    redirect_to products_path if !@product
end 

def get_product
    @product ||= Product.find_by(id: params[:product_id])
end 

def review_params 
    params.require(:review).permit(:category_id, :description, :product_id)
end 

end