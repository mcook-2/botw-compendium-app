class TreasuresController < ApplicationController
  before_action :set_treasure, only: %i[ show edit update destroy ]

  # GET /treasures or /treasures.json
  def index
    @treasures = Treasure.all
  end

  # GET /treasures/1 or /treasures/1.json
  def show
  end

  # GET /treasures/new
  def new
    @treasure = Treasure.new
  end

  # GET /treasures/1/edit
  def edit
  end

  # POST /treasures or /treasures.json
  def create
    @treasure = Treasure.new(treasure_params)

    respond_to do |format|
      if @treasure.save
        format.html { redirect_to treasure_url(@treasure), notice: "Treasure was successfully created." }
        format.json { render :show, status: :created, location: @treasure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treasure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treasures/1 or /treasures/1.json
  def update
    respond_to do |format|
      if @treasure.update(treasure_params)
        format.html { redirect_to treasure_url(@treasure), notice: "Treasure was successfully updated." }
        format.json { render :show, status: :ok, location: @treasure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treasure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treasures/1 or /treasures/1.json
  def destroy
    @treasure.destroy!

    respond_to do |format|
      format.html { redirect_to treasures_url, notice: "Treasure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treasure
      @treasure = Treasure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treasure_params
      params.require(:treasure).permit(:name, :description, :image_url, :dlc)
    end
end
