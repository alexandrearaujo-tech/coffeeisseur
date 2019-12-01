class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy, :update]
  before_action :set_booking, only: [:new, :create]

  def show
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = current_user
    @experience = Experience.find(@booking.experience_id)
    authorize @review

    if @review.save
      @experience.average_rating = (@experience.average_rating + @review.rating) / @experience.reviews.count
      @experience.save!
      redirect_to experience_path(@experience)
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

  def set_booking
    @booking = Booking.find(params[:booking_id])
    authorize @booking
  end

  def review_params
    params.require(:review).permit(:content, :rating, :compliment_id, :booking_id)
  end
end
