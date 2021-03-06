class TitlesController < ApplicationController
  before_action :require_login
  before_action :authenticate_user!
  before_action :set_title, only: %i[ show edit update destroy ]
  
  layout 'backend'

  # GET /titles or /titles.json
  def index
    authorize! :read, Title, :message => "Unable to load this page."

    #@titles = Title.all
    @titles = Title.order(:label).page params[:page]

    @titles_grid = TitlesGrid.new(params[:titles_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  # GET /titles/1 or /titles/1.json
  def show
  end

  # GET /titles/new
  def new
    authorize! :create, Title, :message => "Unable to create a Title record."
    @title = Title.new
  end

  # GET /titles/1/edit
  def edit
    authorize! :update, Title, :message => "Unable to edit this Title record."
  end

  # POST /titles or /titles.json
  def create
    authorize! :create, Title, :message => "Unable to create this Title record."
    @title = Title.new(title_params)

    respond_to do |format|
      if @title.save
        format.html { redirect_to @title, notice: "Title was successfully created." }
        format.json { render :show, status: :created, location: @title }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /titles/1 or /titles/1.json
  def update
    authorize! :update, Title, :message => "Unable to update this Title record."

    respond_to do |format|
      if @title.update(title_params)
        format.html { redirect_to @title, notice: "Title was successfully updated." }
        format.json { render :show, status: :ok, location: @title }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titles/1 or /titles/1.json
  def destroy
    authorize! :destroy, Title, :message => "Unable to destroy this Title record."
    @title.destroy

    respond_to do |format|
      format.html { redirect_to titles_url, notice: "Title was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_title
      authorize! :read, Title, :message => "Unable to read this Title record."

      begin
        @title = Title.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @title = nil
      end
    end

    # Only allow a list of trusted parameters through.
    def title_params
      params.require(:title).permit(:abbreviation, :label, :unabridged, :description)
    end
end
