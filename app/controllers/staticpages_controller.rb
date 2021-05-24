class StaticpagesController < ApplicationController
    before_action :require_login, only: [:edit, :update, :destroy]
    before_action :authenticate_user!, only: [:edit, :update, :destroy]
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
            render layout: 'blacklight', status: 404
            return false
        end

        if @page.publish? == false
            @page = nil
            render layout: 'blacklight', status: 404
            return false
        end
        @page_title = @page.title
        @page
    end

    def new
        authorize! :create, Staticpage, :message => "Unable to create a Page record."
        @page = Staticpage.new
    end

    def edit
        authorize! :update, Staticpage, :message => "Unable to update this Page record."
    end

    def create
        authorize! :create, Staticpage, :message => "Unable to create a Page record."
        @page = Staticpage.new(page_params)

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
        authorize! :update, Staticpage, :message => "Unable to update this Page record."

        # copy over subject_params into period_attributes so we can alter it
        page_attributes = page_params

        # update modified_by
        page_attributes[:modifiedby] = current_user

        respond_to do |format|
            if @page.update(page_attributes)
                format.html { redirect_to staticpage_path(@page), notice: 'Page was successfully updated.' }
                format.json { render :show, status: :ok, location: @page }
            else
                format.html { render :edit }
                format.json { render json: @page.errors, status: :unprocessable_staticpage }
            end
        end
    end

    def destroy
        authorize! :destroy, Staticpage, :message => "Unable to destroy this Page record."
        @page.destroy

        respond_to do |format|
            format.html { redirect_to staticpages_path, notice: 'Page was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_staticpage
            authorize! :read, Staticpage, :message => "Unable to read this Page record."

            begin
                @page = Staticpage.find(params[:id])
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
