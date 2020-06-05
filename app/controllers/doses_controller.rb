class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  # GET /doses/new
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  # POST /doses
  # POST /doses.json
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    respond_to do |format|
      if @dose.save
        format.html { redirect_to cocktails_path, notice: 'Dose was successfully created.' }
        format.json { render :show, status: :created, location: @dose }
      else
        format.html { render :new }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doses/1
  # DELETE /doses/1.json
  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_path, notice: 'Dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dose
    @dose = Dose.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
