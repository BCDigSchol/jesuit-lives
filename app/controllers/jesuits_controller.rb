class JesuitsController < ApplicationController
  before_action :set_jesuit, only: %i[ show edit update destroy ]

  layout 'backend'

  # GET /jesuits or /jesuits.json
  def index
    #@jesuits = Jesuit.all
    @jesuits = Jesuit.order(:last_name).page params[:page]
  end

  # GET /jesuits/1 or /jesuits/1.json
  def show
  end

  # GET /jesuits/new
  def new
    @jesuit = Jesuit.new
  end

  # GET /jesuits/1/edit
  def edit
  end

  # POST /jesuits or /jesuits.json
  def create
    @jesuit = Jesuit.new(jesuit_params)

    respond_to do |format|
      if @jesuit.save
        format.html { redirect_to @jesuit, notice: "Jesuit was successfully created." }
        format.json { render :show, status: :created, location: @jesuit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jesuit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jesuits/1 or /jesuits/1.json
  def update
    respond_to do |format|
      if @jesuit.update(jesuit_params)
        format.html { redirect_to @jesuit, notice: "Jesuit was successfully updated." }
        format.json { render :show, status: :ok, location: @jesuit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jesuit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jesuits/1 or /jesuits/1.json
  def destroy
    @jesuit.destroy
    respond_to do |format|
      format.html { redirect_to jesuits_url, notice: "Jesuit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_jesuit
    @jesuit = Jesuit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def jesuit_params
    params.require(:jesuit).permit(:jl_id, :title_id, :last_name, :first_name_abbrev, :first_name, :birth_date_id, :place_of_birth_id, :entrance_date_id, :entrance_date_2_id, :entrance_province_id, :entrance_province_2_id, :status_id, :vow_date_id, :death_date_id)
  end

end
