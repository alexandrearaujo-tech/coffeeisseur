class UserExperiencesController < ApplicationController
  def create
    @user_experience = UserExperience.new(experience_params)
    @user_experience.user = current_user
    authorize @user_experience

    if @user_experience.save
      redirect_to experience_path(@user_experience.experience_id)
    else
      render :new
    end
  end

  private

  def experience_params
    params.permit(:experience_id)
  end
end
