class JesuitsController < ApplicationController
  before_action :require_login
  before_action :authenticate_user!
  before_action :set_jesuit, only: %i[ show edit update destroy ]

  layout 'backend'

  # GET /jesuits or /jesuits.json
  def index
    authorize! :read, Jesuit, :message => "Unable to load this page."

    #@jesuits = Jesuit.all
    @jesuits = Jesuit.order(:last_name).page params[:page]

    @jesuits_grid = JesuitsGrid.new(params[:jesuits_grid]) do |scope|
      scope.page(params[:page])
    end
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
    authorize! :create, Jesuit, :message => "Unable to create this Jesuit record."

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
    authorize! :update, @jesuit, :message => "Unable to update this Jesuit record."

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
    authorize! :destroy, @jesuit, :message => "Unable to destroy this Jesuit record."

    @jesuit.destroy
    respond_to do |format|
      format.html { redirect_to jesuits_url, notice: "Jesuit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_jesuit
    begin
      @jesuit = Jesuit.find(params[:id])
      authorize! :read, @jesuit, :message => "Unable to read this Jesuit record."
    rescue ActiveRecord::RecordNotFound => e
      @jesuit = nil
    end
  end

  # Only allow a list of trusted parameters through.
  def jesuit_params
    params.require(:jesuit).permit(:jl_id, :title_id, :last_name, :first_name_abbrev, :first_name, :birth_date_id, :place_of_birth_id, :entrance_date_id, :entrance_date_2_id, :entrance_province_id, :entrance_province_2_id, :status_id, :vow_date_id, :death_date_id)
  end

end
