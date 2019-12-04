class CardsController < ApplicationController
  before_action :set_card, only: [:show, :update]

  def index
    @cards = policy_scope(Card).where(user_id: current_user.id)
    @places = policy_scope(Place)
  end

  def new
    @card = Card.new
    authorize @card
  end

  def create
    @card = Card.new(card_params)
    @card.user = current_user
    authorize @card

    if @card.save
      redirect_to cards_path
    else
      render :new
    end
  end

  def show
    @places = Place.all
    authorize @places
    url = ENV['CURRENT_URL_ROOT']
    qrcode = RQRCode::QRCode.new("#{url}/redeem/#{@card.id}")

    @svg = qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )
  end

  def generate
    respond_to do |format|
      format.svg { render inline: svg }
    end
  end

  def destroy
  end

  def update
    authorize @card
    @card.redeemed!
    @card.save!
    redirect_to user_path(current_user)
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:place_id)
  end
end
