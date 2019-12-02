class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_after_action :verify_authorized, only: [:home, :map]

  def home
    @experiences = Experience.all
    @places = Place.all
  end

  def map
    @places = Place.geocoded #returns flats with coordinates

      @markers = @places.map do |place|
        {
          lat: place.latitude,
          lng: place.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { place: place })
        }
      end
  end

  def search
    authorize User
    @sug = Place.all.pluck(:name)

    if params[:query].present?
      @places = Place.global_search(params[:query])
    else
      @places = []
    end
  end

  def autocomplete
    authorize User
    results = AutocompleteSearchService.new(params[:query]).call

    render json: results
  end
end
