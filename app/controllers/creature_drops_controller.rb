class CreatureDropsController < ApplicationController
  before_action :set_creature_drop, only: %i[ show edit update destroy ]

  # GET /creature_drops or /creature_drops.json
  def index
    @creature_drops = CreatureDrop.all
  end

  # GET /creature_drops/1 or /creature_drops/1.json
  def show
  end

  # GET /creature_drops/new
  def new
    @creature_drop = CreatureDrop.new
  end

  # GET /creature_drops/1/edit
  def edit
  end

  # POST /creature_drops or /creature_drops.json
  def create
    @creature_drop = CreatureDrop.new(creature_drop_params)

    respond_to do |format|
      if @creature_drop.save
        format.html { redirect_to creature_drop_url(@creature_drop), notice: "Creature drop was successfully created." }
        format.json { render :show, status: :created, location: @creature_drop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @creature_drop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creature_drops/1 or /creature_drops/1.json
  def update
    respond_to do |format|
      if @creature_drop.update(creature_drop_params)
        format.html { redirect_to creature_drop_url(@creature_drop), notice: "Creature drop was successfully updated." }
        format.json { render :show, status: :ok, location: @creature_drop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @creature_drop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creature_drops/1 or /creature_drops/1.json
  def destroy
    @creature_drop.destroy!

    respond_to do |format|
      format.html { redirect_to creature_drops_url, notice: "Creature drop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creature_drop
      @creature_drop = CreatureDrop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def creature_drop_params
      params.require(:creature_drop).permit(:creature_id, :drop_id)
    end
end
