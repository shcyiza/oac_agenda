class ResasController < ApplicationController
  before_action :set_resa, only: [:show, :edit, :update, :destroy]

  # GET /resas
  # GET /resas.json
  def index
    @resas = Resa.all
  end

  # GET /resas/1
  # GET /resas/1.json
  def show
  end

  # GET /resas/new
  def new
    @resa = Resa.new
  end

  # GET /resas/1/edit
  def edit
  end

  # POST /resas
  # POST /resas.json
  def create
    @resa = Resa.new(resa_params)

    respond_to do |format|
      if @resa.save
        format.html { redirect_to @resa, notice: 'Resa was successfully created.' }
        format.json { render :show, status: :created, location: @resa }
      else
        format.html { render :new }
        format.json { render json: @resa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resas/1
  # PATCH/PUT /resas/1.json
  def update
    respond_to do |format|
      if @resa.update(resa_params)
        format.html { redirect_to @resa, notice: 'Resa was successfully updated.' }
        format.json { render :show, status: :ok, location: @resa }
      else
        format.html { render :edit }
        format.json { render json: @resa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resas/1
  # DELETE /resas/1.json
  def destroy
    @resa.destroy
    respond_to do |format|
      format.html { redirect_to resas_url, notice: 'Resa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resa
      @resa = Resa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resa_params
      params.require(:resa).permit(:user_id, :event_id, :resanr, :resa_claimed)
    end
end
