class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_after_action :verify_authorized, only: [:home]
  def home
    @experiences = Experience.all
    @places = Place.all
  end

  def search
    authorize User
    # if params[:query].present?
    #   sql_query = "name ILIKE :query OR city ILIKE :query OR street ILIKE :query"
    #   @places = Place.where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @Places = Place.all
    # end
    @places = Place.global_search(params[:query])

    if params[:query].present?
      sql_query = " \
        places.name @@ :query \
        OR places.street @@ :query \
        OR places.city @@ :query \
      "
      @places = Place.where(sql_query, query: "%#{params[:query]}%")
    else
      @places = Place.all
    end
  end
end
