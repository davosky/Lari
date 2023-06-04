class PublicSectorsController < ApplicationController
  before_action :set_public_sector, only: %i[ show edit update destroy ]

  def index
    @q = PublicSector.ransack(params[:q])
    @public_sectors = @q.result(distinct: true).order("position ASC").page(params[:page])
  end

  def show
    @public_sector = PublicSector.find(params[:id])
  end

  def new
    @public_sector = PublicSector.new
  end

  def edit
  end

  def create
    @public_sector = PublicSector.new(public_sector_params)

    if @public_sector.save
      redirect_to public_sectors_path, notice: "public_sector was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @public_sector.update(public_sector_params)
      redirect_to public_sectors_path, notice: "public_sector was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @public_sector.destroy
    redirect_to public_sectors_url, notice: "public_sector was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_public_sector
    @public_sector = PublicSector.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def public_sector_params
    params.require(:public_sector).permit(:id, :name, :position)
  end
end
