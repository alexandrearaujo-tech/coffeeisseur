class CardsController < ApplicationController
  # @user = current_user
  # authorize @user
  @user = User.where(email: "ale@ale")

  def show
  end

  def index
    @cards = Card.where(user_id: @user.id)
  end

  def new
  end

  def destroy
  end

  def update
  end
end
