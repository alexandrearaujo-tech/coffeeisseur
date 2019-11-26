class ExperiencesController < ApplicationController
  def index
    @categories = Category.all
    @experiences = Experience.all
  end

  def show

  end
end
