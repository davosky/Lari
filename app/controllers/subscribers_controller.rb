class SubscribersController < ApplicationController
  before_action :set_subscriber, only: %i[ show edit update destroy ]

  def index
    @q = Subscriber.ransack(params[:q])
    @subscribers = @q.result(distinct: true).order("subscription_date DESC").page(params[:page])
  end

  def show
    @subscriber = Subscriber.find(params[:id])
    respond_to do |format|
      format.html
      format.json
      format.turbo_stream
      format.pdf { render template: "subscribers/print", pdf: "print" }
    end
  end

  def new
    @subscriber = Subscriber.new
  end

  def edit
  end

  def create
    @subscriber = current_operator.subscribers.build(subscriber_params)

    @subscriber.fulloperatorname = "#{current_operator.last_name} #{current_operator.first_name}"
    if @subscriber.save
      redirect_to subscribers_path, notice: "subscriber was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @subscriber.updater = "#{current_operator.last_name} #{current_operator.first_name}"
    if @subscriber.update(subscriber_params)
      redirect_to subscribers_path, notice: "subscriber was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subscriber.destroy
    redirect_to subscribers_url, notice: "subscriber was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subscriber
    @subscriber = Subscriber.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subscriber_params
    params.require(:subscriber).permit(:id, :code, :subscription_date, :fiscal_code, :first_name, :last_name, :birth_date, :birth_place, :sex_id, :nationality, :citizenship, :address, :house_number, :zip, :city, :province, :phone, :mobile, :email, :operator, :updater, :category_id, :delivery_card_id, :occupation_id, :private_sector_id, :public_sector_id, :subscription_reason_id, :subscription_type_id, :fulloperatorname, :operator_id, :amount, :privacy_first_id, :privacy_second_id, :privacy_third_id)
  end
end
