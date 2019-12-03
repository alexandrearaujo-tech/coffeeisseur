class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @cards = Card.where(user_id: current_user.id).order('place_id DESC')
    authorize @cards
    @places = Place.all
    authorize @places
    @experiences = Experience.all
    authorize @experiences
    @user_places = UserPlace.where(user_id: current_user.id).order('place_id DESC')
    authorize @user_places
    @review = Review.new
    authorize @review
  end

  def edit
  end

  def update
  end
end
