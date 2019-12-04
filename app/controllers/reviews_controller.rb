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
    authorize @review
    @experience = Experience.find(@booking.experience_id)
    authorize @experience
    if @review.save
      experience_avg
      card_stamp
      redirect_to user_path(current_user)
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

  def experience_avg
    @experience.average_rating = (@experience.average_rating + @review.rating) / @experience.reviews.count
    @experience.save!
  end

  def card_stamp
    @cards = Card.where(user_id: current_user.id).where(state: 0).where(place_id: @experience.place_id)
    authorize @cards
    if @cards.count.zero?
      @card = Card.new
      @card.user_id = current_user.id
      @card.place_id = @experience.place_id
      @card.stamp_count = 1
      @card.save!
    else
      @cards.first.stamp_count += 1 if @cards.first.stamp_count < 5
      @cards.first.completed! if @cards.first.stamp_count == 5
      @cards.first.save!
    end
  end
end
