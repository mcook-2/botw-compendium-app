class MonsterDropsController < ApplicationController
  before_action :set_monster_drop, only: %i[ show edit update destroy ]

  # GET /monster_drops or /monster_drops.json
  def index
    @monster_drops = MonsterDrop.all
  end

  # GET /monster_drops/1 or /monster_drops/1.json
  def show
  end

  # GET /monster_drops/new
  def new
    @monster_drop = MonsterDrop.new
  end

  # GET /monster_drops/1/edit
  def edit
  end

  # POST /monster_drops or /monster_drops.json
  def create
    @monster_drop = MonsterDrop.new(monster_drop_params)

    respond_to do |format|
      if @monster_drop.save
        format.html { redirect_to monster_drop_url(@monster_drop), notice: "Monster drop was successfully created." }
        format.json { render :show, status: :created, location: @monster_drop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @monster_drop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_drops/1 or /monster_drops/1.json
  def update
    respond_to do |format|
      if @monster_drop.update(monster_drop_params)
        format.html { redirect_to monster_drop_url(@monster_drop), notice: "Monster drop was successfully updated." }
        format.json { render :show, status: :ok, location: @monster_drop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @monster_drop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_drops/1 or /monster_drops/1.json
  def destroy
    @monster_drop.destroy!

    respond_to do |format|
      format.html { redirect_to monster_drops_url, notice: "Monster drop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_drop
      @monster_drop = MonsterDrop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def monster_drop_params
      params.require(:monster_drop).permit(:monster_id, :drop_id)
    end
end
