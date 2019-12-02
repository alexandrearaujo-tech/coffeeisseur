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

  def experience_avg
    @experience.average_rating = (@experience.average_rating + @review.rating) / @experience.reviews.count
    @experience.save!
  end

  def card_stamp
    @cards = Card.where(user_id: current_user.id).where(place_id: @experience.place_id)
    @card = Card.new
    authorize @card
    @card.user_id = current_user.id
    @card.place_id = @experience.place_id
    if @cards.last.state.active? || @cards.nil?
      @card.stamp_count = 1
      @card.active!
    elsif @cards.last.completed?
      @new_card = Card.create!(
        user_id: @card.user_id,
        place_id: @card.place_id,
        stamp_count: 1
      )
      @new_card.save!
      @new_card.active!
    else
      @card = Card.where(user_id: current_user.id).where(place_id: @experience.place_id).last
      if @card.stamp_count < 5
        @card.stamp_count += 1
        @card.completed! if @card.stamp_count == 5
      end
    end
    @card.save!
  end
end
