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
          lng: place.longitude
        }
      end

  end
end
