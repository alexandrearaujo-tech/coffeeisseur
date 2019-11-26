class PlacesController < ApplicationController
  before_action :set_place, only: [:show]
  # skip_before_action :authenticate_user!, only: %i[index]

  def show
    # authorize @places
    # @Reviews = @Place.experience.booking.review
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :street, :city, :photo)
  end
end
