class FoleventsController < ApplicationController
  before_action :set_folevent, only: [:show, :edit, :update, :destroy]

  # GET /folevents
  # GET /folevents.json
  def index
    @folevents = Folevent.all
  end

  # GET /folevents/1
  # GET /folevents/1.json
  def show
  end

  # GET /folevents/new
  def new
    @folevent = Folevent.new
  end

  # GET /folevents/1/edit
  def edit
  end

  # POST /folevents
  # POST /folevents.json
  def create
    @folevent = Folevent.new(folevent_params)

    respond_to do |format|
      if @folevent.save
        format.html { redirect_to @folevent, notice: 'Folevent was successfully created.' }
        format.json { render :show, status: :created, location: @folevent }
      else
        format.html { render :new }
        format.json { render json: @folevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folevents/1
  # PATCH/PUT /folevents/1.json
  def update
    respond_to do |format|
      if @folevent.update(folevent_params)
        format.html { redirect_to @folevent, notice: 'Folevent was successfully updated.' }
        format.json { render :show, status: :ok, location: @folevent }
      else
        format.html { render :edit }
        format.json { render json: @folevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folevents/1
  # DELETE /folevents/1.json
  def destroy
    @folevent.destroy
    respond_to do |format|
      format.html { redirect_to folevents_url, notice: 'Folevent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folevent
      @folevent = Folevent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folevent_params
      params.require(:folevent).permit(:user_id, :event_id)
    end
end
