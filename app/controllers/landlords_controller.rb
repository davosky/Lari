class LandlordsController < ApplicationController
  before_action :set_landlord, only: %i[ show edit update destroy ]

  def index
    @q = Landlord.ransack(params[:q])
    @landlords = @q.result(distinct: true).order("code DESC").page(params[:page])
  end

  def show
    @landlord = Landlord.find(params[:id])
    @buildings = @landlord.buildings
  end

  def new
    @landlord = Landlord.new
  end

  def edit
  end

  def create
    @landlord = current_operator.landlords.build(landlord_params)

    @landlord.fulloperatorname = "#{current_operator.last_name} #{current_operator.first_name}"
    if @landlord.save
      redirect_to landlords_path, notice: "landlord was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @landlord.updater = "#{current_operator.last_name} #{current_operator.first_name}"
    if @landlord.update(landlord_params)
      redirect_to landlords_path, notice: "landlord was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @landlord.destroy
    redirect_to landlords_url, notice: "landlord was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_landlord
    @landlord = Landlord.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def landlord_params
    params.require(:landlord).permit(:id, :code, :company_name, :fiscal_code, :first_name, :last_name, :sex_id, :address, :house_number, :zip, :city, :province, :phone, :mobile, :email, :operator, :updater, :landlord_type_id, :fulloperatorname, :operator_id)
  end
end
