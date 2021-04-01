class StaticpagesController < ApplicationController
    protect_from_forgery with: :exception

    before_action :set_staticpage, only: [:show, :edit, :update, :destroy]

    layout 'backend'

    def index
        authorize! :read, Staticpage, :message => "Unable to load this page."

        @pages = Staticpage.all
    end

    def show
    end

    def load_page
        begin
            @page = Staticpage.find_by!(slug: params[:slug])
        rescue ActiveRecord::RecordNotFound => e
            @page = nil
            render :file => "#{Rails.root}/public/404", layout: 'blacklight', status: 404
            return false
        end
        @page
    end

    def new
        @page = Staticpage.new
    end

    def edit
    end

    def create
        @page = Staticpage.new(page_params)

        authorize! :create, @page, :message => "Unable to create this Page record."

        @page.createdby = current_user
        @page.modifiedby = current_user

        if @page.save
            respond_to do |format|
                format.html { redirect_to staticpage_path(@page), notice: 'Page was successfully created.' }
                format.json { render :show, status: :created, location: @page }
            end
        else
            respond_to do |format|
                format.html { render :new }
                format.json { render json: @page.errors, status: :unprocessable_staticpage }
            end
        end
    end

    def update
        authorize! :update, @page, :message => "Unable to update this Page record."

        # copy over subject_params into period_attributes so we can alter it
        page_attributes = page_params

        # update modified_by
        page_attributes[:modifiedby] = current_user

        if @page.update(page_attributes)
            respond_to do |format|
                format.html { redirect_to staticpage_path(@page), notice: 'Page was successfully updated.' }
                format.json { render :show, status: :ok, location: @page }
            end
        else
            respond_to do |format|
                format.html { render :edit }
                format.json { render json: @page.errors, status: :unprocessable_staticpage }
            end
        end
    end

    def destroy
        authorize! :destroy, @page, :message => "Unable to destroy this Page record."

        @page.destroy
        respond_to do |format|
            format.html { redirect_to staticpages_path, notice: 'Page was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_staticpage
            begin
                @page = Staticpage.find(params[:id])
                authorize! :read, @page, :message => "Unable to read this Page record."
            rescue ActiveRecord::RecordNotFound => e
                @page = nil
            end
        end

        def page_params
            params.require(:staticpage).permit(:title, :slug, :description, :rank, :body, :blurb, :publish)
        end

        def resolve_layout
            case action_name
            when 'load_page'
                'blacklight'
            else
                'backend'
            end
        end
end
