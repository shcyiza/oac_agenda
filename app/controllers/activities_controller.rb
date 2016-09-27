class ActivitiesController < ApplicationController
before_action :authenticate_user!
  def index
      @activities = Activity.order("created_at desc")
      @events = Event.all
      @foldates = Foldate.all
      @folevents = Folevent.all
      @orgns = Orgn.all
  end



  def folevent_params
    params.require(:activity).permit(:action, :trackable)
  end

end
