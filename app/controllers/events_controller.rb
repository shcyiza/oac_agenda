class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index_pro]
  require 'will_paginate/array'

  # GET /events
  # GET /events.json
  def index
    # still_relevent and month are define in the model
    @events = Event.still_relevent
    @event_months = @events.group_by(&:month)
    @page_by_mouths = @event_months.to_a.paginate(:page => params[:page], :per_page => 3)
  end

  # GET /event/index_pro
  def index_pro
  # vieuws where the organiszer will be able to see his events if he has an organisation
    if current_user.orgns.count > 0

        if current_user.events.count > 0
          @events = current_user.events.order(esdate: :asc).paginate(:page => params[:page], :per_page => 10)
          @events_paged = @events.to_a.paginate(:page => params[:page], :per_page => 20)
        else
        # if he doesn't have any events lead him to the event create page
          redirect_to new_event_path, :alert => "Vous avez pas encore d'événement"
        end

    elsif current_user.pro == true
    # the user must be a pro to be able to create anything
      redirect_to new_orgn_path, :alert => "Vous avez pas encore d'organisation"
    else
    # if he doesn't have any organisation lead him to the orgn create page
      redirect_to :back, :alert => "demande invalide"
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    if user_signed_in?
      # user must be signed in to follow an event and a event creator can't follow his own event but modify it
      unless current_user.id == @event.user.id
        @folevent = Folevent.new(event_id: @event.id, user_id: current_user.id)
      else
      end
    end
  end

  # GET /event/hashtag/conferences
  def hashtags
  # index to see all the event related to a specific #hashtag written in the event descpriction
    @tag = Tag.find_by(name: params[:name])
    @events = Tag.find_by(name: params[:name]).events.where('eedate > ?', Time.now).order(esdate: :asc).paginate(:page => params[:page], :per_page => 10)
  end


  # GET /events/new
  def new
    if user_signed_in?
      if current_user.orgns.count > 0
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
          format.html { redirect_to :back, notice: 'Event was successfully created.' }
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
