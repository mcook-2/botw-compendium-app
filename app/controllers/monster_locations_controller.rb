class MonsterLocationsController < ApplicationController
  before_action :set_monster_location, only: %i[ show edit update destroy ]

  # GET /monster_locations or /monster_locations.json
  def index
    @monster_locations = MonsterLocation.all
  end

  # GET /monster_locations/1 or /monster_locations/1.json
  def show
  end

  # GET /monster_locations/new
  def new
    @monster_location = MonsterLocation.new
  end

  # GET /monster_locations/1/edit
  def edit
  end

  # POST /monster_locations or /monster_locations.json
  def create
    @monster_location = MonsterLocation.new(monster_location_params)

    respond_to do |format|
      if @monster_location.save
        format.html { redirect_to monster_location_url(@monster_location), notice: "Monster location was successfully created." }
        format.json { render :show, status: :created, location: @monster_location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @monster_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_locations/1 or /monster_locations/1.json
  def update
    respond_to do |format|
      if @monster_location.update(monster_location_params)
        format.html { redirect_to monster_location_url(@monster_location), notice: "Monster location was successfully updated." }
        format.json { render :show, status: :ok, location: @monster_location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @monster_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_locations/1 or /monster_locations/1.json
  def destroy
    @monster_location.destroy!

    respond_to do |format|
      format.html { redirect_to monster_locations_url, notice: "Monster location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_location
      @monster_location = MonsterLocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def monster_location_params
      params.require(:monster_location).permit(:monster_id, :location_id)
    end
end
