class CreatureLocationsController < ApplicationController
  before_action :set_creature_location, only: %i[ show edit update destroy ]

  # GET /creature_locations or /creature_locations.json
  def index
    @creature_locations = CreatureLocation.all
  end

  # GET /creature_locations/1 or /creature_locations/1.json
  def show
  end

  # GET /creature_locations/new
  def new
    @creature_location = CreatureLocation.new
  end

  # GET /creature_locations/1/edit
  def edit
  end

  # POST /creature_locations or /creature_locations.json
  def create
    @creature_location = CreatureLocation.new(creature_location_params)

    respond_to do |format|
      if @creature_location.save
        format.html { redirect_to creature_location_url(@creature_location), notice: "Creature location was successfully created." }
        format.json { render :show, status: :created, location: @creature_location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @creature_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creature_locations/1 or /creature_locations/1.json
  def update
    respond_to do |format|
      if @creature_location.update(creature_location_params)
        format.html { redirect_to creature_location_url(@creature_location), notice: "Creature location was successfully updated." }
        format.json { render :show, status: :ok, location: @creature_location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @creature_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creature_locations/1 or /creature_locations/1.json
  def destroy
    @creature_location.destroy!

    respond_to do |format|
      format.html { redirect_to creature_locations_url, notice: "Creature location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creature_location
      @creature_location = CreatureLocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def creature_location_params
      params.require(:creature_location).permit(:creature_id, :location_id)
    end
end
