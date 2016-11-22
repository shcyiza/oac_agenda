class OrgnsController < ApplicationController
  before_action :set_orgn, only: [:show, :edit, :update, :destroy]

  # GET /orgns
  # GET /orgns.json
  def index
    @orgns = Orgn.paginate(:page => params[:page], :per_page => 12)
    @folorgs = Folorg.all
  end

  # GET /orgns/1
  # GET /orgns/1.json
  def show
    @events = Event.where(orgn_id: params[:id]).order(esdate: :asc)
    @folorgs = Folorg.where(orgn_id: params[:id]).all
    if user_signed_in? && current_user.id != @orgn.user.id
      @newfolorg = Folorg.new(orgn_id: params[:id], user_id: current_user.id)
      @folorg = @folorgs.where(user_id: current_user).first
      @your_likes = @orgn.your_likes(current_user, @orgn)
    else
    end
  end

  def index_pro
    unless user_signed_in?
      redirect_to new_user_session_path , notice: 'Vous devez vous connecter'
    else
      if current_user.orgns.count > 0
        @orgns = Orgn.where(user: current_user).paginate(:page => params[:page], :per_page => 12)
      elsif current_user.pro == true
        redirect_to new_orgn_path, :alert => "Vous avez pas encore d'organisation"
      else
        #configuré les mails pour le rediriger vers les contact
        redirect_to :back, :alert => "demande invalide"
      end
    end
  end

  # GET /orgns/new
  def new
    # un user ne peut créer un magazin que si il a fait la demande de signé un contract
    if user_signed_in? && current_user.pro == true
      #lier user a son new shop automatiquement
      @orgn = Orgn.new(user: current_user)
    else
      redirect_to :back, :alert => "Vous devez être enrgistré comme commercant pour cette fonctionalité"
    end
  end

  # GET /orgns/1/edit
  def edit
    if user_signed_in?
      if current_user.id == @orgn.user.id
      else
        redirect_to orgns_path , alert: 'Chemain non autorisé'
      end
    else
      redirect_to new_user_session_path, notice: 'Chemain non autorisé'
    end
  end

  # POST /orgns
  # POST /orgns.json
  def create
    @orgn = Orgn.new(orgn_params)

    respond_to do |format|
      if @orgn.save
        track_activity @orgn
        if current_user.orgns.count <= 1 && (Time.now - 20..Time.now).cover?(@orgn.created_at)
          format.html do
            redirect_to '/proagenda', notice: "Bienvenue sur le Ka'agenda"
          end
        else
          format.html { redirect_to @orgn, notice: 'Orgn was successfully created.' }
          format.json { render :show, status: :created, location: @orgn }
        end
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
      params.require(:orgn).permit(:user_id, :oname, :odesc, :oemail, :onum, :avatar)
    end

    def folorg_params
      params.require(:folorg).permit(:user_id, :orgn_id)
    end

    def folevent_params
      params.require(:folevent).permit(:user_id, :event_id)
    end
end
