class CardsController < ApplicationController
  before_action :set_card, only: [:show]
  skip_before_action :authenticate_user!

  def index
    @user = current_user
    # @cards = Card.where(user_id: 6)
  end

  def new
    @card = Card.new
    authorize @card
  end

  def create
    @card = Card.new(card_params)
    # @place.user = current_user
    authorize @card

    if @card.save
      redirect_to card_path(@card)
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end

  def update
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:user_id, :place_id)
  end
end
