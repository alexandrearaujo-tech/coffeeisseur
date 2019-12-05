class UserExperiencesController < ApplicationController
  before_action :set_experience

  def create
    @user_experience = UserExperience.new(experience_params)
    @user_experience.user = current_user
    authorize @user_experience

    if @user_experience.save
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def destroy
    @user_experience = UserExperience.find_by(user: current_user, experience: @experience)
    authorize @user_experience
    @user_experience.destroy
    redirect_to experience_path(@experience)
  end

  private

  def experience_params
    params.permit(:experience_id)
  end

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end
end
