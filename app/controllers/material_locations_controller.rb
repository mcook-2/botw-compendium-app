class MaterialLocationsController < ApplicationController
  before_action :set_material_location, only: %i[ show edit update destroy ]

  # GET /material_locations or /material_locations.json
  def index
    @material_locations = MaterialLocation.all
  end

  # GET /material_locations/1 or /material_locations/1.json
  def show
  end

  # GET /material_locations/new
  def new
    @material_location = MaterialLocation.new
  end

  # GET /material_locations/1/edit
  def edit
  end

  # POST /material_locations or /material_locations.json
  def create
    @material_location = MaterialLocation.new(material_location_params)

    respond_to do |format|
      if @material_location.save
        format.html { redirect_to material_location_url(@material_location), notice: "Material location was successfully created." }
        format.json { render :show, status: :created, location: @material_location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @material_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_locations/1 or /material_locations/1.json
  def update
    respond_to do |format|
      if @material_location.update(material_location_params)
        format.html { redirect_to material_location_url(@material_location), notice: "Material location was successfully updated." }
        format.json { render :show, status: :ok, location: @material_location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @material_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_locations/1 or /material_locations/1.json
  def destroy
    @material_location.destroy!

    respond_to do |format|
      format.html { redirect_to material_locations_url, notice: "Material location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_location
      @material_location = MaterialLocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def material_location_params
      params.require(:material_location).permit(:material_id, :location_id)
    end
end
