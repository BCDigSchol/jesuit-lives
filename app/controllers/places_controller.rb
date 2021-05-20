class PlacesController < ApplicationController
  before_action :require_login
  before_action :authenticate_user!
  before_action :set_place, only: %i[ show edit update destroy ]
  
  layout 'backend'

  # GET /places or /places.json
  def index
    authorize! :read, Place, :message => "Unable to load this page."

    #@places = Place.all
    @places = Place.order(:label).page params[:page]

    @places_grid = PlacesGrid.new(params[:places_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  # GET /places/1 or /places/1.json
  def show
  end

  # GET /places/new
  def new
    authorize! :create, Place, :message => "Unable to create a Place record."
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
    authorize! :update, Place, :message => "Unable to update this Place record."
  end

  # POST /places or /places.json
  def create
    authorize! :create, Place, :message => "Unable to create this Place record."
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: "Place was successfully created." }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1 or /places/1.json
  def update
    authorize! :update, Place, :message => "Unable to update this Place record."

    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: "Place was successfully updated." }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1 or /places/1.json
  def destroy
    authorize! :destroy, Place, :message => "Unable to destroy this Place record."
    @place.destroy
  
    respond_to do |format|
      format.html { redirect_to places_url, notice: "Place was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      authorize! :read, Place, :message => "Unable to read this Place record."

      begin
        @place = Place.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @place = nil
      end
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:label, :latitude, :longitude, :description)
    end
end
