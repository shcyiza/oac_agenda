class BelgiaController < ApplicationController
  before_action :set_belgium, only: [:show, :edit, :update, :destroy]

  # GET /belgia
  # GET /belgia.json
  def index
    @belgia = Belgium.all
  end

  # GET /belgia/1
  # GET /belgia/1.json
  def show
  end

  # GET /belgia/new
  def new
    @belgium = Belgium.new
  end

  # GET /belgia/1/edit
  def edit
  end

  # POST /belgia
  # POST /belgia.json
  def create
    @belgium = Belgium.new(belgium_params)

    respond_to do |format|
      if @belgium.save
        format.html { redirect_to @belgium, notice: 'Belgium was successfully created.' }
        format.json { render :show, status: :created, location: @belgium }
      else
        format.html { render :new }
        format.json { render json: @belgium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /belgia/1
  # PATCH/PUT /belgia/1.json
  def update
    respond_to do |format|
      if @belgium.update(belgium_params)
        format.html { redirect_to @belgium, notice: 'Belgium was successfully updated.' }
        format.json { render :show, status: :ok, location: @belgium }
      else
        format.html { render :edit }
        format.json { render json: @belgium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /belgia/1
  # DELETE /belgia/1.json
  def destroy
    @belgium.destroy
    respond_to do |format|
      format.html { redirect_to belgia_url, notice: 'Belgium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_belgium
      @belgium = Belgium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def belgium_params
      params.require(:belgium).permit(:ville, :codepostal)
    end
end
