class SonosSystemsController < ApplicationController
  before_action :set_sonos_system, only: %i[ show edit update destroy ]

  # GET /sonos_systems or /sonos_systems.json
  def index
    @sonos_systems = SonosSystem.all
  end

  # GET /sonos_systems/1 or /sonos_systems/1.json
  def show
  end

  # GET /sonos_systems/new
  def new
    @sonos_system = SonosSystem.new
  end

  # GET /sonos_systems/1/edit
  def edit
  end

  # POST /sonos_systems or /sonos_systems.json
  def create
    @sonos_system = SonosSystem.new(sonos_system_params)

    respond_to do |format|
      if @sonos_system.save
        format.html { redirect_to @sonos_system, notice: "Sonos system was successfully created." }
        format.json { render :show, status: :created, location: @sonos_system }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sonos_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sonos_systems/1 or /sonos_systems/1.json
  def update
    respond_to do |format|
      if @sonos_system.update(sonos_system_params)
        format.html { redirect_to @sonos_system, notice: "Sonos system was successfully updated." }
        format.json { render :show, status: :ok, location: @sonos_system }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sonos_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sonos_systems/1 or /sonos_systems/1.json
  def destroy
    @sonos_system.destroy
    respond_to do |format|
      format.html { redirect_to sonos_systems_url, notice: "Sonos system was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sonos_system
      @sonos_system = SonosSystem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sonos_system_params
      params.require(:sonos_system).permit(:name, :ip, :default)
    end
end
