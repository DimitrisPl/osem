module Admin
  class SponsorshipsController < ApplicationController
    before_action :set_sponsorship, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource :conference, find_by: :short_title
    authorize_resource
    # GET /sponsorships
    # GET /sponsorships.json
    def index
      # hand written:
      #@sponsorships = Sponsorship.where(resource: @conference)
      @sponsorships = Sponsorship.all
      authorize! :index, @Sponsorship

      # scaffond generated:
      respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @sponsorships }
      end
    end

    # GET /sponsorships/1
    # GET /sponsorships/1.json
    def show
      
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @sponsorship }
      end
    end

    # GET /sponsorships/new
    def new
      @sponsorship = Sponsorship.new
    end

    # GET /sponsorships/1/edit
    def edit
    end

    # POST /sponsorships
    # POST /sponsorships.json
    def create
      @sponsorship = Sponsorship.new(sponsorship_params)

      respond_to do |format|
        if @sponsorship.save
          format.html { redirect_to @sponsorship, notice: 'Sponsorship was successfully created.' }
          format.json { render json: @sponsorship, status: :created }
        else
          format.html { render action: 'new' }
          format.json { render json: @sponsorship.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /sponsorships/1
    # PATCH/PUT /sponsorships/1.json
    def update
      respond_to do |format|
        if @sponsorship.update(sponsorship_params)
          format.html { redirect_to @sponsorship, notice: 'Sponsorship was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @sponsorship.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /sponsorships/1
    # DELETE /sponsorships/1.json
    def destroy
      @sponsorship.destroy
      respond_to do |format|
        format.html { redirect_to sponsorships_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_sponsorship
        @sponsorship = Sponsorship.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def sponsorship_params
        params.require(:sponsorship).permit(:Sponsor_id, :status, :category, :amount, :created_at, :updated_at)
      end
  end
end
