class OrgnsController < ApplicationController
  before_action :set_orgn, only: [:show, :edit, :update, :destroy]

  # GET /orgns
  # GET /orgns.json
  def index
    @orgns = Orgn.all
  end

  # GET /orgns/1
  # GET /orgns/1.json
  def show
    if user_signed_in? && current_user.id != @orgn.user.id
      @folorg = Folorg.new(orgn_id: params[:id], user_id: current_user.id)
    else
    end
  end

  # GET /orgns/new
  def new
    # un user ne peut créer un magazin que si il a fait la demande de signé un contract
    if user_signed_in? && current_user.pro == true
      #lier user a son new shop automatiquement
      @orgn = Orgn.new(user_id: current_user.id)
    else
      redirect_to :back, :alert => "Vous devez être enrgistré comme commercant pour cette fonctionalité"
    end
  end

  # GET /orgns/1/edit
  def edit
  end

  # POST /orgns
  # POST /orgns.json
  def create
    @orgn = Orgn.new(orgn_params)

    respond_to do |format|
      if @orgn.save
        track_activity @orgn
        format.html { redirect_to @orgn, notice: 'Orgn was successfully created.' }
        format.json { render :show, status: :created, location: @orgn }
      else
        format.html { render :new }
        format.json { render json: @orgn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orgns/1
  # PATCH/PUT /orgns/1.json
  def update
    respond_to do |format|
      if @orgn.update(orgn_params)
        track_activity @orgn
        format.html { redirect_to @orgn, notice: 'Orgn was successfully updated.' }
        format.json { render :show, status: :ok, location: @orgn }
      else
        format.html { render :edit }
        format.json { render json: @orgn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orgns/1
  # DELETE /orgns/1.json
  def destroy
    @orgn.destroy
    track_activity @orgn
    respond_to do |format|
      format.html { redirect_to orgns_url, notice: 'Orgn was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orgn
      @orgn = Orgn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orgn_params
      params.require(:orgn).permit(:user_id, :oname, :odesc, :oemail, :onum)
    end

    def folorg_params
      params.require(:folorg).permit(:user_id, :orgn_id)
    end
end
