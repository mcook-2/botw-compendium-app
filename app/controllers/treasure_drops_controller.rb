class TreasureDropsController < ApplicationController
  before_action :set_treasure_drop, only: %i[ show edit update destroy ]

  # GET /treasure_drops or /treasure_drops.json
  def index
    @treasure_drops = TreasureDrop.all
  end

  # GET /treasure_drops/1 or /treasure_drops/1.json
  def show
  end

  # GET /treasure_drops/new
  def new
    @treasure_drop = TreasureDrop.new
  end

  # GET /treasure_drops/1/edit
  def edit
  end

  # POST /treasure_drops or /treasure_drops.json
  def create
    @treasure_drop = TreasureDrop.new(treasure_drop_params)

    respond_to do |format|
      if @treasure_drop.save
        format.html { redirect_to treasure_drop_url(@treasure_drop), notice: "Treasure drop was successfully created." }
        format.json { render :show, status: :created, location: @treasure_drop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treasure_drop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treasure_drops/1 or /treasure_drops/1.json
  def update
    respond_to do |format|
      if @treasure_drop.update(treasure_drop_params)
        format.html { redirect_to treasure_drop_url(@treasure_drop), notice: "Treasure drop was successfully updated." }
        format.json { render :show, status: :ok, location: @treasure_drop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treasure_drop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treasure_drops/1 or /treasure_drops/1.json
  def destroy
    @treasure_drop.destroy!

    respond_to do |format|
      format.html { redirect_to treasure_drops_url, notice: "Treasure drop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treasure_drop
      @treasure_drop = TreasureDrop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treasure_drop_params
      params.require(:treasure_drop).permit(:treasure_id, :drop_id)
    end
end
