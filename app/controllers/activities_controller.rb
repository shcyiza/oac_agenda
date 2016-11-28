class ActivitiesController < ApplicationController
before_action :authenticate_user!
  def index
      current_user.update_attribute(:last_click_at, Time.now)
      @activities = Activity.from_others(current_user)
      @events = Event.still_relevent
      @foldates = Foldate.where("datefolwd >= ?", Date.today)
      @folevents = Folevent.all
      @orgns = Orgn.all
  end

  def folevent_params
    params.require(:activity).permit(:action, :trackable)
  end

end
