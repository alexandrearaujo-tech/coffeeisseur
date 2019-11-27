class BookingsController < ApplicationController
  def index
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end
  #new branch

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
  end

  def edit
    authorize @booking
  end

  def update
    authroize @booking
  end

  def destroy
    authroize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :experience_id, :date, :state)
  end

end
