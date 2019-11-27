class PlacesController < ApplicationController
  before_action :set_place, only: [:show]
  skip_before_action :authenticate_user!

  def index
    @places = policy_scope(Place)
  end

  def new
    @place = Place.new
    # authorize @place
  end

  def create
    @place = Place.new(place_params)
    # @place.user = current_user
    # authorize @palace

    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

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
