class ReviewsController < ApplicationController

def index
    get_product
end 

def new
    get_product
    redirect_to product_path if !@product
    @review=Review.new 
end 

def create
    @product= Product.find_by(id: params[:review][:product_id])
    @review= Review.new(review_params)
    if @review.save
        redirect_to product_reviews_path(@review.product)
    else 
         render:new
    end 
end 

private 

def get_product
    @product ||= Product.find_by(id: params[:product_id])
end 

def review_params 
    params.require(:review).permit(:category_id, :description, :product_id)
end 

end