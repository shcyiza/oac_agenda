class FolorgsController < ApplicationController
  before_action :authenticate_user!, :set_folorg, only: [:show, :edit, :update, :destroy]

  # GET /folorgs
  # GET /folorgs.json
  def index
    if user_signed_in?
      if current_user.folorgs.count >= 1
        @folorgs = Folorg.where(user: current_user)
        @orgns = Orgn.joins(:folorgs).merge(Folorg.where(:user => current_user)).paginate(:page => params[:page], :per_page => 12)
      else
        redirect_to orgns_path , alert: "Vous ne suivez pas encore d'organisation"
      end
    else
      redirect_to new_user_session_path , alert: 'Vous devez vous connecter'
    end
  end

  # GET /folorgs/1
  # GET /folorgs/1.json
  def show
  end

  # GET /folorgs/new
  def new
      @folorg = Folorg.new
  end

  # GET /folorgs/1/edit
  def edit
  end

  # POST /folorgs
  # POST /folorgs.json
  def create
    @folorg = Folorg.new(folorg_params)

    respond_to do |format|
      if @folorg.save
        format.html { redirect_to :back, notice: 'Vous suivez desormais cette organisation' }
        format.json { render :show, status: :created, location: @folorg }
      else
        format.html { render :new }
        format.json { render json: @folorg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folorgs/1
  # PATCH/PUT /folorgs/1.json
  def update
    respond_to do |format|
      if @folorg.update(folorg_params)
        format.html { redirect_to @folorg, notice: 'Folorg was successfully updated.' }
        format.json { render :show, status: :ok, location: @folorg }
      else
        format.html { render :edit }
        format.json { render json: @folorg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folorgs/1
  # DELETE /folorgs/1.json
  def destroy
    @folorg.destroy
    respond_to do |format|
      format.html { redirect_to :back, alert: 'vous ne suivez plus cette organisation' }
      format.json { render :back}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folorg
      @folorg = Folorg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folorg_params
      params.require(:folorg).permit(:user_id, :orgn_id)
    end
end
