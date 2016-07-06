class FoldatesController < ApplicationController
  before_action :set_foldate, only: [:show, :edit, :update, :destroy]

  # GET /foldates
  # GET /foldates.json
  def index
    @foldates = Foldate.all
  end

  # GET /foldates/1
  # GET /foldates/1.json
  def show
  end

  # GET /foldates/new
  def new
    @foldate = Foldate.new
  end

  # GET /foldates/1/edit
  def edit
  end

  # POST /foldates
  # POST /foldates.json
  def create
    @foldate = Foldate.new(foldate_params)

    respond_to do |format|
      if @foldate.save
        format.html { redirect_to @foldate, notice: 'Foldate was successfully created.' }
        format.json { render :show, status: :created, location: @foldate }
      else
        format.html { render :new }
        format.json { render json: @foldate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foldates/1
  # PATCH/PUT /foldates/1.json
  def update
    respond_to do |format|
      if @foldate.update(foldate_params)
        format.html { redirect_to @foldate, notice: 'Foldate was successfully updated.' }
        format.json { render :show, status: :ok, location: @foldate }
      else
        format.html { render :edit }
        format.json { render json: @foldate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foldates/1
  # DELETE /foldates/1.json
  def destroy
    @foldate.destroy
    respond_to do |format|
      format.html { redirect_to foldates_url, notice: 'Foldate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foldate
      @foldate = Foldate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foldate_params
      params.require(:foldate).permit(:user_id, :datefolwd)
    end
end
