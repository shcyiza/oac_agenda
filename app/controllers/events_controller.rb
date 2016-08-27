class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.where('eedate > ?', Time.now).order(esdate: :asc)
    @event_months = @events.group_by{ |e| e.esdate.beginning_of_month }
  end

  # GET /events/1
  # GET /events/1.json
  def show
    if user_signed_in?
      unless current_user.id == @event.orgn.user.id
        @folevent = Folevent.new(event_id: params[:id], user_id: current_user.id)
      else
      end
    end
  end

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @events = Tag.find_by(name: params[:name]).events
  end

  # GET /events/new
  def new
    if user_signed_in?
      if current_user.orgn.count > 0
        @event = Event.new
      elsif current_user.pro == true
        redirect_to new_orgn_path, :alert => "Vous avez pas encore d'organisation"
      else
        redirect_to :back, :alert => "demande invalide"
      end
    else
      redirect_to :back, :alert => "demande invalide"
    end
  end

  # GET /events/1/edit
  def edit
    if current_user.id == @event.orgn.user.id
    else
      redirect_to :back, :alert => "Vous n'êtes pas l'organisateur de cette evenement"
    end
  end

  # POST /events
  # POST /events.json
  def create
      @event = Event.new(event_params)
      respond_to do |format|
        if @event.save
          track_activity @event
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if current_user.id == @event.orgn.user.id
      respond_to do |format|
        if @event.update(event_params)
          track_activity @event
          format.html { redirect_to @event, notice: 'Event was successfully updated.' }
          format.json { render :show, status: :ok, location: @event }
        else
          format.html { render :edit }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to :back, :alert => "demande invalide"
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    track_activity @event
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:orgn_id, :enom, :edesc, :esdate, :esdate_date, :esdate_hour, :esdate_min, :eedate, :eedate_date, :eedate_hour, :eedate_min, :pafpre, :pafplace, :pays, :ville, :codepostal, :rue, :nrrue, :flyer, :public)
    end

    def folevent_params
      params.require(:folevent).permit(:user_id, :event_id)
    end
end
