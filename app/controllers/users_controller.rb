class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @cards = Card.where(user_id: current_user.id).order('place_id DESC')
    @places = Place.all
    authorize @cards
    authorize @places
  end

  def edit
  end

  def update
  end
end
