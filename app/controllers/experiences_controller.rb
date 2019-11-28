class ExperiencesController < ApplicationController
  require 'rqrcode'

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

    generate_qr(@experience.qr_code)

    @booking = Booking.new
  end

  def generate_qr(url)
    qrcode = RQRCode::QRCode.new(url)

    @barcode = qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end
end
