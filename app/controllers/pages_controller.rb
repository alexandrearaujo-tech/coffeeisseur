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

    if params[:query].present?
      @places = Place.global_search(params[:query])
    else
      @places = []
    end

    # if params[:query].present?
    #   sql_query = " \
    #     places.name @@ :query \
    #     OR places.street @@ :query \
    #     OR places.city @@ :query \
    #   "
    #   @places = Place.where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @places = Place.all
    # end

  end
end
