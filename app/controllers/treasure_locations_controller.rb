class TreasureLocationsController < ApplicationController
  before_action :set_treasure_location, only: %i[ show edit update destroy ]

  # GET /treasure_locations or /treasure_locations.json
  def index
    @treasure_locations = TreasureLocation.all
  end

  # GET /treasure_locations/1 or /treasure_locations/1.json
  def show
  end

  # GET /treasure_locations/new
  def new
    @treasure_location = TreasureLocation.new
  end

  # GET /treasure_locations/1/edit
  def edit
  end

  # POST /treasure_locations or /treasure_locations.json
  def create
    @treasure_location = TreasureLocation.new(treasure_location_params)

    respond_to do |format|
      if @treasure_location.save
        format.html { redirect_to treasure_location_url(@treasure_location), notice: "Treasure location was successfully created." }
        format.json { render :show, status: :created, location: @treasure_location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treasure_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treasure_locations/1 or /treasure_locations/1.json
  def update
    respond_to do |format|
      if @treasure_location.update(treasure_location_params)
        format.html { redirect_to treasure_location_url(@treasure_location), notice: "Treasure location was successfully updated." }
        format.json { render :show, status: :ok, location: @treasure_location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treasure_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treasure_locations/1 or /treasure_locations/1.json
  def destroy
    @treasure_location.destroy!

    respond_to do |format|
      format.html { redirect_to treasure_locations_url, notice: "Treasure location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treasure_location
      @treasure_location = TreasureLocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treasure_location_params
      params.require(:treasure_location).permit(:treasure_id, :location_id)
    end
end
