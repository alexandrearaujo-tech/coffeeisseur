class UserPlacesController < ApplicationController

  def create
    @user_place = UserPlace.new(place_params)
    @user_place.user = current_user
    authorize @user_place

    if @user_place.save
      redirect_to place_path(@user_place.place_id)
    else
      render :new
    end
  end

  private

  def place_params
    params.permit(:place_id)
  end
end
