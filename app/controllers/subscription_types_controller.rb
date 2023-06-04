class SubscriptionTypesController < ApplicationController
  before_action :set_subscription_type, only: %i[ show edit update destroy ]

  def index
    @q = SubscriptionType.ransack(params[:q])
    @subscription_types = @q.result(distinct: true).order("position ASC").page(params[:page])
  end

  def show
    @subscription_type = SubscriptionType.find(params[:id])
  end

  def new
    @subscription_type = SubscriptionType.new
  end

  def edit
  end

  def create
    @subscription_type = SubscriptionType.new(subscription_type_params)

    if @subscription_type.save
      redirect_to subscription_types_path, notice: "subscription_type was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @subscription_type.update(subscription_type_params)
      redirect_to subscription_types_path, notice: "subscription_type was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subscription_type.destroy
    redirect_to subscription_types_url, notice: "subscription_type was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subscription_type
    @subscription_type = subscription_type.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subscription_type_params
    params.require(:subscription_type).permit(:id, :name, :position)
  end
end
