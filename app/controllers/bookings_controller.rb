class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
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
    @experience = @booking.experience

    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    authorize @booking
  end

  def update
    if @booking.update(booking_params)
      redirect_to user_path(current_user)
    else
      render :edit # print edit.html.erb
    end

    authorize @booking
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :experience_id, :date, :state)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
