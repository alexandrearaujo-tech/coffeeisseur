class PlacesController < ApplicationController
  before_action :set_place, only: [:show]
  skip_before_action :authenticate_user!


  def show
    @experiences = Experience.where(place_id: @place)
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :street, :city, :photo)
  end
end
