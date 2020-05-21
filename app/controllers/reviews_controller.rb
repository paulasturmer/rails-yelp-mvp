class ReviewsController < ApplicationController
    before_action :find_review, only: [:show]
    before_action :find_restaurant, only: [:new, :create]

    def show
        @restaurant = Restaurant.find(@review.restaurant.id)
      end
    
    def new
        @review = Review.new
      end
        
    def create
        @review = Review.new(review_params)
        @review.restaurant = @restaurant
        if @review.save
          redirect_to restaurant_path(@review.restaurant_id)
        else
          render :new
        end
    end

    private

    def find_review
        @review = Review.find(params[:id])
    end

    def find_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def review_params
        params.require(:review).permit(:rating, :content)
    end
end
