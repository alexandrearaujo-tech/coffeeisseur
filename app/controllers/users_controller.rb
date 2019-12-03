class UsersController < ApplicationController
  before_action :user_params, only: [:update]

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
    @user = User.find(current_user.id)
    authorize @user
    @user.update!(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end
