class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show]

  def index
    if params[:category_id].present?
      @experiences = policy_scope(Experience.where(category_id: params[:category_id]))
    else
      @experiences = Experience.all
    end
      @categories = Category.all
  end

  def show
    authorize @experience
    @booking = Booking.new
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end
end
