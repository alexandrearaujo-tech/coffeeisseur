class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @cards = Card.where(user_id: current_user.id).order('place_id DESC')
    @places = Place.all
    @experiences = Experience.all
    authorize @cards
    authorize @places
    authorize @experiences
    @user_places = UserPlace.where(user_id: current_user.id).order('place_id DESC')
    authorize @user_places
  end

  def edit
  end

  def update
  end
end
