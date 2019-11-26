class ExperiencesController < ApplicationController
  def index
    if params[:category_id].present?
      @experiences = Experience.where(category_id: params[:category_id])
    else
      @experiences = Experience.all
    end
    @categories = Category.all
  end

  def show

  end
end
