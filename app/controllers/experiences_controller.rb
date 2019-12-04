class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_experience, only: [:show]

  def index
    if params[:category_id].present?
      @experiences = policy_scope(Experience.where(category_id: params[:category_id]))
    else
      @experiences = policy_scope(Experience)
    end
    @categories = Category.all
  end

  def show
    authorize @experience
    @booking = Booking.new

    @user_experiences = UserExperience.where(experience_id: @experience.id)

    @compliments = @experience.reviews.all.group(:compliment).count
    @compliments_sum = @experience.reviews.all.size

  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end
end
