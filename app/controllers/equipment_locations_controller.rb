class EquipmentLocationsController < ApplicationController
  before_action :set_equipment_location, only: %i[ show edit update destroy ]

  # GET /equipment_locations or /equipment_locations.json
  def index
    @equipment_locations = EquipmentLocation.all
  end

  # GET /equipment_locations/1 or /equipment_locations/1.json
  def show
  end

  # GET /equipment_locations/new
  def new
    @equipment_location = EquipmentLocation.new
  end

  # GET /equipment_locations/1/edit
  def edit
  end

  # POST /equipment_locations or /equipment_locations.json
  def create
    @equipment_location = EquipmentLocation.new(equipment_location_params)

    respond_to do |format|
      if @equipment_location.save
        format.html { redirect_to equipment_location_url(@equipment_location), notice: "Equipment location was successfully created." }
        format.json { render :show, status: :created, location: @equipment_location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @equipment_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment_locations/1 or /equipment_locations/1.json
  def update
    respond_to do |format|
      if @equipment_location.update(equipment_location_params)
        format.html { redirect_to equipment_location_url(@equipment_location), notice: "Equipment location was successfully updated." }
        format.json { render :show, status: :ok, location: @equipment_location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equipment_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_locations/1 or /equipment_locations/1.json
  def destroy
    @equipment_location.destroy!

    respond_to do |format|
      format.html { redirect_to equipment_locations_url, notice: "Equipment location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment_location
      @equipment_location = EquipmentLocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipment_location_params
      params.require(:equipment_location).permit(:equipment_id, :location_id)
    end
end
