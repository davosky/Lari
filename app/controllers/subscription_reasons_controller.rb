class SubscriptionReasonsController < ApplicationController
  before_action :set_subscription_reason, only: %i[ show edit update destroy ]

  def index
    @q = SubscriptionReason.ransack(params[:q])
    @subscription_reasons = @q.result(distinct: true).order("position ASC").page(params[:page])
  end

  def show
    @subscription_reason = SubscriptionReason.find(params[:id])
  end

  def new
    @subscription_reason = SubscriptionReason.new
  end

  def edit
  end

  def create
    @subscription_reason = SubscriptionReason.new(subscription_reason_params)

    if @subscription_reason.save
      redirect_to subscription_reasons_path, notice: "subscription_reason was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @subscription_reason.update(subscription_reason_params)
      redirect_to subscription_reasons_path, notice: "subscription_reason was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subscription_reason.destroy
    redirect_to subscription_reasons_url, notice: "subscription_reason was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subscription_reason
    @subscription_reason = SubscriptionReason.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subscription_reason_params
    params.require(:subscription_reason).permit(:id, :name, :position)
  end
end
