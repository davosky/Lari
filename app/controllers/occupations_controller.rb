class OccupationsController < ApplicationController
  before_action :set_occupation, only: %i[ show edit update destroy ]

  def index
    @q = Occupation.ransack(params[:q])
    @occupations = @q.result(distinct: true).order("position ASC").page(params[:page])
  end

  def show
    @occupation = Occupation.find(params[:id])
  end

  def new
    @occupation = Occupation.new
  end

  def edit
  end

  def create
    @occupation = Occupation.new(occupation_params)

    if @occupation.save
      redirect_to occupations_path, notice: "occupation was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @occupation.update(occupation_params)
      redirect_to occupations_path, notice: "occupation was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @occupation.destroy
    redirect_to occupations_url, notice: "occupation was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_occupation
    @occupation = Occupation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def occupation_params
    params.require(:occupation).permit(:id, :name, :position)
  end
end
