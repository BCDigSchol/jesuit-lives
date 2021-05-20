class ProvincesController < ApplicationController
  before_action :require_login
  before_action :authenticate_user!
  before_action :set_province, only: %i[ show edit update destroy ]

  layout 'backend'

  # GET /provinces or /provinces.json
  def index
    authorize! :read, Province, :message => "Unable to load this page."

    #@provinces = Province.all
    @provinces = Province.order(:abbreviation).page params[:page]

    @provinces_grid = ProvincesGrid.new(params[:provinces_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  # GET /provinces/1 or /provinces/1.json
  def show
  end

  # GET /provinces/new
  def new
    authorize! :create, Province, :message => "Unable to read this Province record."
    @province = Province.new
  end

  # GET /provinces/1/edit
  def edit
    authorize! :update, Province, :message => "Unable to update this Province record."
  end

  # POST /provinces or /provinces.json
  def create
    authorize! :create, Province, :message => "Unable to create this Province record."
    @province = Province.new(province_params)

    respond_to do |format|
      if @province.save
        format.html { redirect_to @province, notice: "Province was successfully created." }
        format.json { render :show, status: :created, location: @province }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @province.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provinces/1 or /provinces/1.json
  def update
    authorize! :update, Province, :message => "Unable to update this Province record."

    respond_to do |format|
      if @province.update(province_params)
        format.html { redirect_to @province, notice: "Province was successfully updated." }
        format.json { render :show, status: :ok, location: @province }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @province.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provinces/1 or /provinces/1.json
  def destroy
    authorize! :destroy, Province, :message => "Unable to destroy this Province record."
    @province.destroy

    respond_to do |format|
      format.html { redirect_to provinces_url, notice: "Province was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_province
      authorize! :read, Province, :message => "Unable to read this Province record."

      begin
        @province = Province.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @province = nil
      end
    end

    # Only allow a list of trusted parameters through.
    def province_params
      params.require(:province).permit(:label, :abbreviation, :unabridged, :description)
    end
end
