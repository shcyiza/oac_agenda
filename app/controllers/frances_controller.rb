class FrancesController < ApplicationController
  before_action :set_france, only: [:show, :edit, :update, :destroy]

  # GET /frances
  # GET /frances.json
  def index
    @frances = France.all
  end

  # GET /frances/1
  # GET /frances/1.json
  def show
  end

  # GET /frances/new
  def new
    @france = France.new
  end

  # GET /frances/1/edit
  def edit
  end

  # POST /frances
  # POST /frances.json
  def create
    @france = France.new(france_params)

    respond_to do |format|
      if @france.save
        format.html { redirect_to @france, notice: 'France was successfully created.' }
        format.json { render :show, status: :created, location: @france }
      else
        format.html { render :new }
        format.json { render json: @france.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frances/1
  # PATCH/PUT /frances/1.json
  def update
    respond_to do |format|
      if @france.update(france_params)
        format.html { redirect_to @france, notice: 'France was successfully updated.' }
        format.json { render :show, status: :ok, location: @france }
      else
        format.html { render :edit }
        format.json { render json: @france.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frances/1
  # DELETE /frances/1.json
  def destroy
    @france.destroy
    respond_to do |format|
      format.html { redirect_to frances_url, notice: 'France was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_france
      @france = France.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def france_params
      params.require(:france).permit(:ville, :codepostal)
    end
end
