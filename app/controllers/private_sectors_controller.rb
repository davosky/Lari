class PrivateSectorsController < ApplicationController
  before_action :set_private_sector, only: %i[ show edit update destroy ]

  def index
    @q = PrivateSector.ransack(params[:q])
    @private_sectors = @q.result(distinct: true).order("position ASC").page(params[:page])
  end

  def show
    @private_sector = PrivateSector.find(params[:id])
  end

  def new
    @private_sector = PrivateSector.new
  end

  def edit
  end

  def create
    @private_sector = PrivateSector.new(private_sector_params)

    if @private_sector.save
      redirect_to private_sectors_path, notice: "private_sector was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @private_sector.update(private_sector_params)
      redirect_to private_sectors_path, notice: "private_sector was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @private_sector.destroy
    redirect_to private_sectors_url, notice: "private_sector was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_private_sector
    @private_sector = PrivateSector.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def private_sector_params
    params.require(:private_sector).permit(:id, :name, :position)
  end
end
