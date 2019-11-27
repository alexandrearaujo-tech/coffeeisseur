class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy, :update]
  def show
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review

    if @review.save
      redirect_to review_path
    else
      render :new
    end
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private

  def set_review
    @card = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :compliment_id, :booking_id)
  end
end
