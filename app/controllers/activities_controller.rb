class ActivitiesController < ApplicationController
before_action :authenticate_user!
after_action :set_last_seen_at, only: :index
  def index
    current_user.update_attribute(:last_click_at, Time.now)
    @activities = current_user.followed_activities
    @unseen_activities = current_user.not_seen_activities
    @events = Event.still_relevent
    @foldates = Foldate.where("datefolwd >= ?", Date.today)
    @folevents = Folevent.all
    @orgns = Orgn.all
  end

  def folevent_params
    params.require(:activity).permit(:action, :trackable)
  end

  private
  def set_last_seen_at
    current_user.update_attribute(:last_seen_at, current_user.last_click_at)
  end

end
