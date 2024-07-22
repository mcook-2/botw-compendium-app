class EquipmentPropertiesController < ApplicationController
  before_action :set_equipment_property, only: %i[ show edit update destroy ]

  # GET /equipment_properties or /equipment_properties.json
  def index
    @equipment_properties = EquipmentProperty.all
  end

  # GET /equipment_properties/1 or /equipment_properties/1.json
  def show
  end

  # GET /equipment_properties/new
  def new
    @equipment_property = EquipmentProperty.new
  end

  # GET /equipment_properties/1/edit
  def edit
  end

  # POST /equipment_properties or /equipment_properties.json
  def create
    @equipment_property = EquipmentProperty.new(equipment_property_params)

    respond_to do |format|
      if @equipment_property.save
        format.html { redirect_to equipment_property_url(@equipment_property), notice: "Equipment property was successfully created." }
        format.json { render :show, status: :created, location: @equipment_property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @equipment_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment_properties/1 or /equipment_properties/1.json
  def update
    respond_to do |format|
      if @equipment_property.update(equipment_property_params)
        format.html { redirect_to equipment_property_url(@equipment_property), notice: "Equipment property was successfully updated." }
        format.json { render :show, status: :ok, location: @equipment_property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equipment_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_properties/1 or /equipment_properties/1.json
  def destroy
    @equipment_property.destroy!

    respond_to do |format|
      format.html { redirect_to equipment_properties_url, notice: "Equipment property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment_property
      @equipment_property = EquipmentProperty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipment_property_params
      params.require(:equipment_property).permit(:equipment_id, :attack, :defense)
    end
end
