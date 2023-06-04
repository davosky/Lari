class DeliveryCardsController < ApplicationController
  before_action :set_delivery_card, only: %i[ show edit update destroy ]

  def index
    @q = DeliveryCard.ransack(params[:q])
    @delivery_cards = @q.result(distinct: true).order("position ASC").page(params[:page])
  end

  def show
    @delivery_card = DeliveryCard.find(params[:id])
  end

  def new
    @delivery_card = DeliveryCard.new
  end

  def edit
  end

  def create
    @delivery_card = DeliveryCard.new(delivery_card_params)

    if @delivery_card.save
      redirect_to delivery_cards_path, notice: "delivery_card was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @delivery_card.update(delivery_card_params)
      redirect_to delivery_cards_path, notice: "delivery_card was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @delivery_card.destroy
    redirect_to delivery_cards_url, notice: "delivery_card was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_delivery_card
    @delivery_card = DeliveryCard.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def delivery_card_params
    params.require(:delivery_card).permit(:id, :name, :position)
  end
end
