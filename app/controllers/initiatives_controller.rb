class InitiativesController < ApplicationController
  before_action :set_initiative, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /initiatives
  # GET /initiatives.json
  def index
    @initiatives = Initiative.all
    @initiative = Initiative.new
    @users = User.all
    if params[:filter] == 0
      @filter = [true, false]
    elsif params[:filter] == 1
      @filter = true
    elsif params[:filter] == 2
      @filter = false
    end
  end

  # GET /initiatives/1
  # GET /initiatives/1.json
  def show
     @timeline_commitments = @initiative.commitments.order(:due_date)
  end

  # GET /initiatives/new
  def new
    @initiative = Initiative.new
  end

  # GET /initiatives/1/edit
  def edit
  end

  # POST /initiatives
  # POST /initiatives.json
  def create
    @initiative = Initiative.new(initiative_params)
    @initiative.user = current_user
    @initiative.responsible_id = User.find(params[:initiative][:responsible_id])
    respond_to do |format|
      if @initiative.save
        format.html { redirect_to initiatives_path, notice: 'Initiative was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /initiatives/1
  # PATCH/PUT /initiatives/1.json
  def update
    respond_to do |format|
      if @initiative.update(initiative_params)
        format.html { redirect_to initiatives_path, notice: 'Initiative was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /initiatives/1
  # DELETE /initiatives/1.json
  def destroy
    @initiative.commitments.destroy_all
    @initiative.destroy
    respond_to do |format|
      format.html { redirect_to initiatives_url, notice: 'Initiative was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_initiative
      @initiative = Initiative.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def initiative_params
      params.require(:initiative).permit(:title, :description, :filter)
    end
end
